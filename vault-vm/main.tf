terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~>0.9"
    }
  }

  backend "s3" {
    bucket       = "tenzin-cloud"
    key          = "terraform/vault-setup/vault-vm.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }

}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "random_string" "password" {
  length           = 16
  special          = true
  override_special = "-"
}

module "vault-vm" {
  source = "git::https://github.com/tenzin-cloud/vm-builder.git//modules/ubuntu-vm?ref=main"

  # vm credentials
  console_user           = "ubuntu"
  console_password       = random_string.password.result
  automation_user        = "ubuntu"
  automation_user_pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNCeFA0v8d3GQIHmMG1T/CmGieRnqE2Vhwno0qYwgi2PwODbv3sjUFDUHphxLzVjbPf7m7bSRkigVPynfsiV/Ml+Wbt3FgNygy2WGbOJKoSMhKPAwPZwfrpdG/OkO4q+SjBiqFuBYQVcJ47a4+jrj9C6Fbse3fR43/ZxxIZDKCMlIZBC75J2uXHSiwbVYIh/EX2w4unZgO8KyecuRawQCbB3I+LZBKpinnJn+Sb6vJB57GdDlEmVfqPp4nbSDq9xSbtrpoFkniiVxwTsdj9E2xCsfASJywrQeNWVDVnHvHDSxwxBWfmzsfHCJ/N+xDrU0WY6BBoof33ja1+4fhSEZ/LKoLD2H57z18xsgANUHPu1VgUfGn/Wp9BfJ7BYIfD57XufA4IGftFTIcZAGTEFRxEpHQWJ68s5SkN7lyrC3+ph/BJVCS+PnBe78Zjbi0SOdfpzvJQI7/xXVYfOUAVC+undyljKdpHUQpd6BsRmChBEKDnxlupdBVYzJb4mLKlu0="

  # vm settings
  name            = "vault-0"
  cpu_count       = 2
  memory_size_gib = 4
  disk_sizes_gib  = [64]

  # further customizations
  launch_script = file("${path.module}/launch_script.sh")
}
