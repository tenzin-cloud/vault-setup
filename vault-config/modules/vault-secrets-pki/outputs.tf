output "private_ca_issuer_ref" {
  value = vault_pki_secret_backend_issuer.private_ca.issuer_ref
}

output "private_ca_backend" {
  value = vault_pki_secret_backend_role.private_ca.backend
}

output "private_ca_name" {

  value = vault_pki_secret_backend_role.private_ca.name
}

