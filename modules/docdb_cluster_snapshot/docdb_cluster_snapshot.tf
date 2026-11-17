resource "aws_docdb_cluster_snapshot" "docdb_cluster_snapshot" {
  db_cluster_identifier          = var.docdb_cluster_snapshot_db_cluster_identifier
  db_cluster_snapshot_identifier = var.docdb_cluster_snapshot_db_cluster_snapshot_identifier
}
