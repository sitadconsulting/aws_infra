resource "aws_backup_vault" "backup_vault" {
  force_destroy = var.backup_vault_force_destroy
  kms_key_arn   = var.backup_vault_kms_key_arn
  name          = var.backup_vault_name
  tags          = var.backup_vault_tags
}
