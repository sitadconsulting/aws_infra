resource "aws_db_cluster_snapshot" "db_cluster_snapshot" {
  db_cluster_identifier          = var.db_cluster_snapshot_db_cluster_identifier
  db_cluster_snapshot_identifier = var.db_cluster_snapshot_db_cluster_snapshot_identifier
  tags                           = var.db_cluster_snapshot_tags
}
