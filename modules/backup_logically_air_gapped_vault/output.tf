output "backup_logically_air_gapped_vault_arn" {
  description = "ARN of the Logically Air Gapped Backup Vault"
  value       = element(concat(aws_backup_logically_air_gapped_vault.backup_logically_air_gapped_vault.*.arn, [""]), 0)
}
output "backup_logically_air_gapped_vault_id" {
  description = "Name of the Logically Air Gapped Backup Vault"
  value       = element(concat(aws_backup_logically_air_gapped_vault.backup_logically_air_gapped_vault.*.id, [""]), 0)
}
