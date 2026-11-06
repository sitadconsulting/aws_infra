output "backup_vault_notifications_backup_vault_arn" {
  description = "ARN of the vault"
  value       = element(concat(aws_backup_vault_notifications.backup_vault_notifications.*.backup_vault_arn, [""]), 0)
}
output "backup_vault_notifications_id" {
  description = "Name of the vault"
  value       = element(concat(aws_backup_vault_notifications.backup_vault_notifications.*.id, [""]), 0)
}
