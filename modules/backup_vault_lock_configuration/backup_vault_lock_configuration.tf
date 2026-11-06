resource "aws_backup_vault_lock_configuration" "backup_vault_lock_configuration" {
  backup_vault_name   = var.backup_vault_lock_configuration_backup_vault_name
  changeable_for_days = var.backup_vault_lock_configuration_changeable_for_days
  max_retention_days  = var.backup_vault_lock_configuration_max_retention_days
  min_retention_days  = var.backup_vault_lock_configuration_min_retention_days
}
