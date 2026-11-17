resource "aws_docdb_cluster" "docdb_cluster" {
  allow_major_version_upgrade     = var.docdb_cluster_allow_major_version_upgrade
  apply_immediately               = var.docdb_cluster_apply_immediately
  availability_zones              = var.docdb_cluster_availability_zones
  backup_retention_period         = var.docdb_cluster_backup_retention_period
  cluster_identifier_prefix       = var.docdb_cluster_cluster_identifier_prefix
  cluster_identifier              = var.docdb_cluster_cluster_identifier
  db_subnet_group_name            = var.docdb_cluster_db_subnet_group_name
  db_cluster_parameter_group_name = var.docdb_cluster_db_cluster_parameter_group_name
  deletion_protection             = var.docdb_cluster_deletion_protection
  enabled_cloudwatch_logs_exports = var.docdb_cluster_enabled_cloudwatch_logs_exports
  engine_version                  = var.docdb_cluster_engine_version
  engine                          = var.docdb_cluster_engine
  final_snapshot_identifier       = var.docdb_cluster_final_snapshot_identifier
  global_cluster_identifier       = var.docdb_cluster_global_cluster_identifier
  kms_key_id                      = var.docdb_cluster_kms_key_id
  manage_master_user_password     = var.docdb_cluster_manage_master_user_password
  master_password                 = var.docdb_cluster_master_password
  master_password_wo              = var.docdb_cluster_master_password_wo
  master_password_wo_version      = var.docdb_cluster_master_password_wo_version
  master_username                 = var.docdb_cluster_master_username
  network_type                    = var.docdb_cluster_network_type
  port                            = var.docdb_cluster_port
  preferred_backup_window         = var.docdb_cluster_preferred_backup_window
  preferred_maintenance_window    = var.docdb_cluster_preferred_maintenance_window
  skip_final_snapshot             = var.docdb_cluster_skip_final_snapshot
  snapshot_identifier             = var.docdb_cluster_snapshot_identifier
  storage_encrypted               = var.docdb_cluster_storage_encrypted 
  storage_type                    = var.docdb_cluster_storage_type
  tags                            = var.docdb_cluster_tags
  vpc_security_group_ids          = var.docdb_cluster_vpc_security_group_ids

  dynamic "restore_to_point_in_time" {
    for_each = var.docdb_cluster_restore_to_point_in_time
      content {
        restore_to_time            = restore_to_point_in_time.value["restore_to_time"]
        restore_type               = restore_to_point_in_time.value["restore_type"]
        source_cluster_identifier  = restore_to_point_in_time.value["source_cluster_identifier"]
        use_latest_restorable_time = restore_to_point_in_time.value["use_latest_restorable_time"]
      }
  }
  dynamic "serverless_v2_scaling_configuration" {
    for_each = var.docdb_cluster_serverless_v2_scaling_configuration
      content {
        max_capacity = serverless_v2_scaling_configuration.value["max_capacity"]
        min_capacity = serverless_v2_scaling_configuration.value["min_capacity"]        
      }
  }
}
