output "backup_vault_lock_configuration_backup_vault_arn" {
  description = "ARN of the vault"
  value       = element(concat(aws_backup_vault_lock_configuration.backup_vault_lock_configuration.*.backup_vault_arn, [""]), 0)
}
output "backup_vault_lock_configuration_backup_vault_name" {
  description = "Name of the vault"
  value       = element(concat(aws_backup_vault_lock_configuration.backup_vault_lock_configuration.*.backup_vault_name, [""]), 0)
}
