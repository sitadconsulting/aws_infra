resource "aws_rds_cluster" "rds_cluster" {
  allocated_storage                   = var.rds_cluster_allocated_storage
  allow_major_version_upgrade         = var.rds_cluster_allow_major_version_upgrade
  apply_immediately                   = var.rds_cluster_apply_immediately
  availability_zones                  = var.rds_cluster_availability_zones
  backtrack_window                    = var.rds_cluster_backtrack_window
  backup_retention_period             = var.rds_cluster_backup_retention_period
  cluster_identifier_prefix           = var.rds_cluster_cluster_identifier_prefix
  cluster_identifier                  = var.rds_cluster_cluster_identifier
  copy_tags_to_snapshot               = var.rds_cluster_copy_tags_to_snapshot
  database_name                       = var.rds_cluster_database_name
  db_cluster_parameter_group_name     = var.rds_cluster_db_cluster_parameter_group_name
  db_instance_parameter_group_name    = var.rds_cluster_db_instance_parameter_group_name
  db_subnet_group_name                = var.rds_cluster_db_subnet_group_name
  enable_http_endpoint                = var.rds_cluster_enable_http_endpoint
  enabled_cloudwatch_logs_exports     = var.rds_cluster_enabled_cloudwatch_logs_exports
  engine                              = var.rds_cluster_engine
  engine_mode                         = var.rds_cluster_engine_mode
  engine_version                      = var.rds_cluster_engine_version 
  db_cluster_instance_class           = var.rds_cluster_db_cluster_instance_class
  final_snapshot_identifier           = var.rds_cluster_final_snapshot_identifier
  global_cluster_identifier           = var.rds_cluster_global_cluster_identifier
  enable_global_write_forwarding      = var.rds_cluster_enable_global_write_forwarding
  iam_database_authentication_enabled = var.rds_cluster_iam_database_authentication_enabled
  iam_roles                           = var.rds_cluster_iam_roles
  kms_key_id                          = var.rds_cluster_kms_key_id
  manage_master_user_password         = var.rds_cluster_manage_master_user_password
  master_user_secret_kms_key_id       = var.rds_cluster_master_user_secret_kms_key_id
  master_password                     = var.rds_cluster_master_password
  master_username                     = var.rds_cluster_master_username
  port                                = var.rds_cluster_port
  preferred_backup_window             = var.rds_cluster_preferred_backup_window
  preferred_maintenance_window        = var.rds_cluster_preferred_maintenance_window
  replication_source_identifier       = var.rds_cluster_replication_source_identifier
  network_type                        = var.rds_cluster_network_type
  skip_final_snapshot                 = var.rds_cluster_skip_final_snapshot
  snapshot_identifier                 = var.rds_cluster_snapshot_identifier
  source_region                       = var.rds_cluster_source_region
  storage_type                        = var.rds_cluster_storage_type
  iops                                = var.rds_cluster_iops
  storage_encrypted                   = var.rds_cluster_storage_encrypted
  tags                                = var.rds_cluster_tags
  vpc_security_group_ids              = var.rds_cluster_vpc_security_group_ids
  
  dynamic "restore_to_point_in_time" {
    for_each = var.rds_cluster_restore_to_point_in_time
      content {
        restore_to_time             = restore_to_point_in_time.value["restore_to_time"]
        restore_type                = restore_to_point_in_time.value["restore_type"]
        source_cluster_identifier   = restore_to_point_in_time.value["source_cluster_identifier"] 
        use_latest_restorable_time  = restore_to_point_in_time.value["use_latest_restorable_time"]
      }
  }
  dynamic "s3_import" {
    for_each = var.rds_cluster_s3_import
      content {
        bucket_name           = s3_import.value["bucket_name"]
        bucket_prefix         = s3_import.value["bucket_prefix"]
        ingestion_role        = s3_import.value["ingestion_role"]
        source_engine         = s3_import.value["source_engine"]
        source_engine_version = s3_import.value["source_engine_version"]
      }
  }
  dynamic "scaling_configuration" {
    for_each = var.rds_cluster_scaling_configuration
      content {
        auto_pause               = scaling_configuration.value["auto_pause"]
        max_capacity             = scaling_configuration.value["max_capacity"]
        min_capacity             = scaling_configuration.value["min_capacity"]
        seconds_until_auto_pause = scaling_configuration.value["seconds_until_auto_pause"]
        timeout_action           = scaling_configuration.value["timeout_action"]
      }
  }
  dynamic "serverlessv2_scaling_configuration" {
    for_each = var.rds_cluster_serverlessv2_scaling_configuration
      content {
        max_capacity = serverlessv2_scaling_configuration.value["max_capacity"]
        min_capacity = serverlessv2_scaling_configuration.value["min_capacity"]
      }
  }
  lifecycle {
    ignore_changes = [
      engine_version,
      availability_zones,
    ]
  }
}
