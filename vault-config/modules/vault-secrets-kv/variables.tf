variable "description" {
  type    = string
  default = "The Vault KV secrets engine"
}

variable "mount_path" {
  type        = string
  description = "The mount path of the KV version 2 secrets engine"
}

variable "max_versions" {
  type        = number
  default     = 100
  description = "The number of secret versions to keep"
}
