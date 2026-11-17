resource "aws_docdb_global_cluster" "docdb_global_cluster" {
  database_name                = var.docdb_global_cluster_database_name
  deletion_protection          = var.docdb_global_cluster_deletion_protection
  engine                       = var.docdb_global_cluster_engine
  engine_version               = var.docdb_global_cluster_engine_version
  global_cluster_identifier    = var.docdb_global_cluster_global_cluster_identifier
  source_db_cluster_identifier = var.docdb_global_cluster_source_db_cluster_identifier
  storage_encrypted            = var.docdb_global_cluster_storage_encrypted
}
