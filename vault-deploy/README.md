# README
This folder contains the Terraform workspace that deploys a Cloudflare tunnel container and Vault container to my Rapsberry Pi Docker host.  The Cloudflare tunnel token is created from the Cloudflare dashboard under Zero Trust, Networks, Tunnels.  The Cloudflare tunnel is then configured to expose the Vault service to the internet at <https://vault.tenzin.cloud>.


<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_tunnel_token"></a> [cloudflare\_tunnel\_token](#input\_cloudflare\_tunnel\_token) | The Cloudflare tunnel token | `string` | n/a | yes |
<!-- END_TF_DOCS -->
