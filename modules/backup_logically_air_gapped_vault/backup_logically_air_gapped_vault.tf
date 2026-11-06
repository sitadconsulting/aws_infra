resource "aws_backup_logically_air_gapped_vault" "backup_logically_air_gapped_vault" {
  encryption_key_arn = var.backup_logically_air_gapped_vault_encryption_key_arn
  max_retention_days = var.backup_logically_air_gapped_vault_max_retention_days
  min_retention_days = var.backup_logically_air_gapped_vault_min_retention_days
  name               = var.backup_logically_air_gapped_vault_name
  tags               = var.backup_logically_air_gapped_vault_tags
}
