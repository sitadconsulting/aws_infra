resource "aws_rds_global_cluster" "rds_global_cluster" {
  database_name                = var.rds_global_cluster_database_name
  deletion_protection          = var.rds_global_cluster_deletion_protection
  engine                       = var.rds_global_cluster_engine
  engine_version               = var.rds_global_cluster_engine_version
  force_destroy                = var.rds_global_cluster_force_destroy
  global_cluster_identifier    = var.rds_global_cluster_global_cluster_identifier
  source_db_cluster_identifier = var.rds_global_cluster_source_db_cluster_identifier
  storage_encrypted            = var.rds_global_cluster_storage_encrypted

  timeouts {
    create = "30m"
    delete = "30m"
    update = "90m"
  }
}
