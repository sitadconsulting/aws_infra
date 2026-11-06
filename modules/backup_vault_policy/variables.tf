variable "backup_vault_policy_backup_vault_name" {
  description = "(Required) Name of the backup vault to add policy for"
  type        = string
}
variable "backup_vault_policy_policy" {
  description = "(Required) Backup vault access policy document in JSON format"
  type        = string
}
