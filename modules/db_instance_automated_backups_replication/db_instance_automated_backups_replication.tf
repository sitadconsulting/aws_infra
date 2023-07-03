resource "aws_db_instance_automated_backups_replication" "db_instance_automated_backups_replication" {
  kms_key_id             = var.db_instance_automated_backups_replication_kms_key_id
  pre_signed_url         = var.db_instance_automated_backups_replication_pre_signed_url
  retention_period       = var.db_instance_automated_backups_replication_retention_period
  source_db_instance_arn = var.db_instance_automated_backups_replication_source_db_instance_arn

  timeouts {
    create = "75m"
    delete = "75m"
  }
}
