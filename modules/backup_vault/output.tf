output "backup_vault_arn" {
  description = "ARN of the vault"
  value       = element(concat(aws_backup_vault.backup_vault.*.arn, [""]), 0)
}
output "backup_vault_id" {
  description = "Name of the vault"
  value       = element(concat(aws_backup_vault.backup_vault.*.id, [""]), 0)
}
output "backup_vault_recovery_points" {
  description = "Number of recovery points that are stored in a backup vault"
  value       = element(concat(aws_backup_vault.backup_vault.*.recovery_points, [""]), 0)
}
