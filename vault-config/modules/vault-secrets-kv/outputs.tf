output "mount_path" {
  value       = vault_mount.secrets.path
  description = "The mount path of the kv secrets engine"
}
