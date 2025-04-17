# README
This folder contains the Terraform workspace to configure my Vault instance at <https://vault.tenzin.cloud>.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vault_auth_userpass"></a> [vault\_auth\_userpass](#module\_vault\_auth\_userpass) | ./modules/vault-auth-userpass | n/a |
| <a name="module_vault_secrets_kv"></a> [vault\_secrets\_kv](#module\_vault\_secrets\_kv) | ./modules/vault-secrets-kv | n/a |
| <a name="module_vault_secrets_pki"></a> [vault\_secrets\_pki](#module\_vault\_secrets\_pki) | ./modules/vault-secrets-pki | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_policy.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
<!-- END_TF_DOCS -->
