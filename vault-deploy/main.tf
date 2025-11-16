terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.0"
    }
  }

  backend "s3" {
    bucket       = "tenzin-cloud"
    key          = "terraform/vault-setup/vault-deploy.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "docker" {
  host     = "ssh://ubuntu@vault-0.local:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

resource "docker_image" "cloudflared" {
  name = "cloudflare/cloudflared:2025.11.1"
}

resource "docker_image" "vault" {
  name = "hashicorp/vault:1.21"
}

resource "docker_network" "service" {
  name = "service_network"
}

resource "docker_container" "cloudflared" {
  name    = "cloudflared"
  image   = docker_image.cloudflared.image_id
  command = ["tunnel", "run", "vault-tenzin-cloud"]
  env     = ["TUNNEL_TOKEN=${var.cloudflare_tunnel_token}"]
  restart = "unless-stopped"
  networks_advanced {
    name = docker_network.service.id
  }
}

resource "docker_volume" "vault_file" {
  name = "vault_file"
}

resource "docker_volume" "vault_logs" {
  name = "vault_logs"
}

resource "docker_container" "vault" {
  name    = "vault"
  image   = docker_image.vault.image_id
  command = ["server"]
  capabilities {
    add = ["IPC_LOCK"]
  }
  restart = "unless-stopped"
  networks_advanced {
    name = docker_network.service.id
  }
  volumes {
    container_path = "/vault/file"
    volume_name    = docker_volume.vault_file.name
  }
  volumes {
    container_path = "/vault/logs"
    volume_name    = docker_volume.vault_logs.name
  }
  upload {
    file    = "/vault/config/vault-config.hcl"
    content = <<-EOT
      ui = true
      api_addr = "https://vault.tenzin.cloud"
      
      listener "tcp" {
        tls_disable = 1
        address = "0.0.0.0:8200"
        cluster_address = "0.0.0.0:8201"
      }
      
      storage "file" {
        path = "/vault/file"
      }
      
      disable_mlock = true    
    EOT
  }
}

