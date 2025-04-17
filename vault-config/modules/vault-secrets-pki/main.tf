terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

resource "vault_mount" "pki" {
  path                      = var.mount_path
  type                      = "pki"
  description               = var.description
  default_lease_ttl_seconds = 86400
  max_lease_ttl_seconds     = 315360000
}

resource "vault_pki_secret_backend_root_cert" "private_ca" {
  backend     = vault_mount.pki.path
  type        = "internal"
  common_name = "private-ca"
  ttl         = 315360000
  issuer_name = "local-ca"
}

resource "vault_pki_secret_backend_issuer" "private_ca" {
  backend                        = vault_mount.pki.path
  issuer_ref                     = vault_pki_secret_backend_root_cert.private_ca.issuer_id
  issuer_name                    = vault_pki_secret_backend_root_cert.private_ca.issuer_name
  revocation_signature_algorithm = "SHA256WithRSA"
}

resource "vault_pki_secret_backend_role" "private_ca" {
  backend            = vault_mount.pki.path
  name               = "local-servers"
  ttl                = 4060800  // 47 days
  max_ttl            = 17280000 // 200 days
  key_type           = "rsa"
  key_bits           = 2048
  allow_any_name     = true
  allow_bare_domains = true
  allow_glob_domains = true
}

resource "vault_pki_secret_backend_cert" "private_certificates" {
  for_each    = toset(var.private_certificates)
  issuer_ref  = vault_pki_secret_backend_issuer.private_ca.issuer_ref
  backend     = vault_pki_secret_backend_role.private_ca.backend
  name        = vault_pki_secret_backend_role.private_ca.name
  common_name = each.key
  ttl         = 17280000
  revoke      = true
}
