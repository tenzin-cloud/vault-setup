# README
A Terraform module to setup Vault userpass authentication engine.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.7.0 |

## Resources

| Name | Type |
|------|------|
| [random_password.vault_users](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.vault_users](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_kv_secret_v2.vault_user_credentials](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kv_secret_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"The Vault userpass authentication method"` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | n/a | `string` | `"userpass"` | no |
| <a name="input_secrets_mount_path"></a> [secrets\_mount\_path](#input\_secrets\_mount\_path) | The mount path to secrets engine to store the Vault user credentials | `string` | n/a | yes |
| <a name="input_vault_users"></a> [vault\_users](#input\_vault\_users) | A map of Vault usernames to Vault policies | `map(list(string))` | n/a | yes |
<!-- END_TF_DOCS -->
