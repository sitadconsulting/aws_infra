resource "aws_backup_vault_notifications" "backup_vault_notifications" {
  backup_vault_events = var.backup_vault_notifications_backup_vault_events
  backup_vault_name   = var.backup_vault_notifications_backup_vault_name
  sns_topic_arn       = var.backup_vault_notifications_sns_topic_arn
}
