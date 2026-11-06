resource "aws_backup_vault_policy" "backup_vault_policy" {
  backup_vault_name = var.backup_vault_policy_backup_vault_name
  policy            = var.backup_vault_policy_policy
}
