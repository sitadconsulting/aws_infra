resource "aws_rds_cluster_instance" "rds_cluster_instance" {
  apply_immediately                     = var.rds_cluster_instance_apply_immediately
  auto_minor_version_upgrade            = var.rds_cluster_instance_auto_minor_version_upgrade
  availability_zone                     = var.rds_cluster_instance_availability_zone
  ca_cert_identifier                    = var.rds_cluster_instance_ca_cert_identifier
  cluster_identifier                    = var.rds_cluster_instance_cluster_identifier
  copy_tags_to_snapshot                 = var.rds_cluster_instance_copy_tags_to_snapshot
  db_parameter_group_name               = var.rds_cluster_instance_db_parameter_group_name
  db_subnet_group_name                  = var.rds_cluster_instance_db_subnet_group_name
  engine                                = var.rds_cluster_instance_engine
  engine_version                        = var.rds_cluster_instance_engine_version
  identifier                            = var.rds_cluster_instance_identifier
  identifier_prefix                     = var.rds_cluster_instance_identifier_prefix
  instance_class                        = var.rds_cluster_instance_instance_class
  monitoring_interval                   = var.rds_cluster_instance_monitoring_interval
  monitoring_role_arn                   = var.rds_cluster_instance_monitoring_role_arn
  performance_insights_enabled          = var.rds_cluster_instance_performance_insights_enabled
  performance_insights_kms_key_id       = var.rds_cluster_instance_performance_insights_kms_key_id 
  performance_insights_retention_period = var.rds_cluster_instance_performance_insights_retention_period
  preferred_backup_window               = var.rds_cluster_instance_preferred_backup_window
  preferred_maintenance_window          = var.rds_cluster_instance_preferred_maintenance_window
  publicly_accessible                   = var.rds_cluster_instance_publicly_accessible
  promotion_tier                        = var.rds_cluster_instance_promotion_tier
  tags                                  = var.rds_cluster_instance_tags 

   lifecycle {
    ignore_changes = [
      cluster_identifier,
    ]
  }
}
