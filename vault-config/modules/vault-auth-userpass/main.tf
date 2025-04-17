terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

resource "vault_auth_backend" "userpass" {
  type        = "userpass"
  path        = var.mount_path
  description = var.description

  tune {
    default_lease_ttl = "72h"
    max_lease_ttl     = "720h"
  }
}

resource "random_password" "vault_users" {
  for_each = var.vault_users
  special  = false
  length   = 32
}

resource "vault_kv_secret_v2" "vault_user_credentials" {
  for_each = var.vault_users
  mount    = var.secrets_mount_path
  name     = "vault-user-credentials/${each.key}"
  data_json = jsonencode({
    username = each.key
    password = random_password.vault_users[each.key].result
  })
}

resource "vault_generic_endpoint" "vault_users" {
  for_each             = var.vault_users
  path                 = "auth/${vault_auth_backend.userpass.path}/users/${each.key}"
  ignore_absent_fields = true
  data_json = jsonencode({
    policies = each.value
    password = random_password.vault_users[each.key].result
  })
}
