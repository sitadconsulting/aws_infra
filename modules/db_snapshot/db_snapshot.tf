resource "aws_db_snapshot" "db_snapshot" {
  db_instance_identifier = var.db_snapshot_db_instance_identifier
  db_snapshot_identifier = var.db_snapshot_db_snapshot_identifier
  shared_accounts        = var.db_snapshot_shared_accounts
  tags                   = var.db_snapshot_tags
}
