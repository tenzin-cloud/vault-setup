terraform {
  required_version = "~> 1.9"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket       = "tenzin-cloud"
    key          = "terraform/vault-setup/vault-config.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "vault" {
  address = "https://vault.tenzin.cloud"
}

module "vault_secrets_kv" {
  source     = "./modules/vault-secrets-kv"
  mount_path = "secrets"
}

module "vault_auth_userpass" {
  source = "./modules/vault-auth-userpass"
  vault_users = {
    "tenzin" = [vault_policy.vault_admin.name]
  }
  secrets_mount_path = module.vault_secrets_kv.mount_path
}
