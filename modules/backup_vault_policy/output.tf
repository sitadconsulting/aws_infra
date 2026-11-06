output "backup_vault_policy_backup_vault_arn" {
  description = "The ARN assigned by AWS for this provider"
  value       = element(concat(aws_backup_vault_policy.backup_vault_policy.*.backup_vault_arn, [""]), 0)
}
output "backup_vault_policy_id" {
  description = "Name of the vault"
  value       = element(concat(aws_backup_vault_policy.backup_vault_policy.*.id, [""]), 0)
}
