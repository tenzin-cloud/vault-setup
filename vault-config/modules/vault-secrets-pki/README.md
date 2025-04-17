# README
A Terraform module to setup the Vault PKI secrets engine.  See general guide here: <https://developer.hashicorp.com/vault/tutorials/pki/pki-engine>


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.7.0 |

## Resources

| Name | Type |
|------|------|
| [vault_mount.pki](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_pki_secret_backend_cert.private_certificates](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_cert) | resource |
| [vault_pki_secret_backend_issuer.private_ca](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_issuer) | resource |
| [vault_pki_secret_backend_role.private_ca](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_role) | resource |
| [vault_pki_secret_backend_root_cert.private_ca](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_root_cert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"The Vault PKI secrets engine"` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | The mount path of the Vault PKI secrets engine | `string` | n/a | yes |
| <a name="input_private_certificates"></a> [private\_certificates](#input\_private\_certificates) | A list of DNS names to create certificates for | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ca_backend"></a> [private\_ca\_backend](#output\_private\_ca\_backend) | n/a |
| <a name="output_private_ca_issuer_ref"></a> [private\_ca\_issuer\_ref](#output\_private\_ca\_issuer\_ref) | n/a |
| <a name="output_private_ca_name"></a> [private\_ca\_name](#output\_private\_ca\_name) | n/a |
<!-- END_TF_DOCS -->
