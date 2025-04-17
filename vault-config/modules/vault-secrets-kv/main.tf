terraform {
  required_version = "~> 1.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

resource "vault_mount" "secrets" {
  path        = var.mount_path
  type        = "kv-v2"
  description = var.description
  options = {
    version = "2"
    type    = "kv-v2"
  }
}

resource "vault_kv_secret_backend_v2" "secrets" {
  mount        = vault_mount.secrets.path
  max_versions = var.max_versions
  cas_required = false
}
