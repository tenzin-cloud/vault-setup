variable "description" {
  type    = string
  default = "The Vault PKI secrets engine"
}

variable "mount_path" {
  type        = string
  description = "The mount path of the Vault PKI secrets engine"
}

variable "private_certificates" {
  type        = set(string)
  default     = []
  description = "A list of DNS names to create certificates for"
}
