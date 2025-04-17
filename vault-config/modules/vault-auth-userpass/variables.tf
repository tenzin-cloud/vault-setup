variable "mount_path" {
  type    = string
  default = "userpass"
}

variable "description" {
  type    = string
  default = "The Vault userpass authentication method"
}

variable "vault_users" {
  type        = map(list(string))
  description = "A map of Vault usernames to Vault policies"
}

variable "secrets_mount_path" {
  type        = string
  description = "The mount path to secrets engine to store the Vault user credentials"
}
