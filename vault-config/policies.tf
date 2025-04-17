data "vault_policy_document" "vault_admin" {
  rule {
    path         = "*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }
}

resource "vault_policy" "vault_admin" {
  name   = "vault-admin"
  policy = data.vault_policy_document.vault_admin.hcl
}
