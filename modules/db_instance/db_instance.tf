resource "aws_db_instance" "db_instance" {
  allocated_storage                     = var.db_instance_allocated_storage
  allow_major_version_upgrade           = var.db_instance_allow_major_version_upgrade
  apply_immediately                     = var.db_instance_apply_immediately
  auto_minor_version_upgrade            = var.db_instance_auto_minor_version_upgrade
  availability_zone                     = var.db_instance_availability_zone
  backup_retention_period               = var.db_instance_backup_retention_period
  backup_window                         = var.db_instance_backup_window
  ca_cert_identifier                    = var.db_instance_ca_cert_identifier
  character_set_name                    = var.db_instance_character_set_name
  copy_tags_to_snapshot                 = var.db_instance_copy_tags_to_snapshot
  custom_iam_instance_profile           = var.db_instance_custom_iam_instance_profile
  db_name                               = var.db_instance_db_name
  db_subnet_group_name                  = var.db_instance_db_subnet_group_name
  delete_automated_backups              = var.db_instance_delete_automated_backups
  delete_protection                     = var.db_instance_delete_protection
  domain                                = var.db_instance_domain
  domain_iam_role_name                  = var.db_instance_domain_iam_role_name
  enabled_cloudwatch_logs_exports       = var.db_instance_enabled_cloudwatch_logs_exports
  engine                                = var.db_instance_engine
  engine_version                        = var.db_instance_engine_version
  final_snapshot_identifier             = var.db_instance_final_snapshot_identifier
  iam_database_authentication_enabled   = var.db_instance_iam_database_authentication_enabled
  identifier                            = var.db_instance_identifier
  identifier_prefix                     = var.db_instance_identifier_prefix
  instance_class                        = var.db_instance_instance_class
  iops                                  = var.db_instance_iops
  kms_key_id                            = var.db_instance_kms_key_id
  license_model                         = var.db_instance_license_model
  maintenance_window                    = var.db_instance_maintenance_window
  manage_master_user_password           = var.db_instance_manage_master_user_password
  master_user_secret_kms_key_id         = var.db_instance_master_user_secret_kms_key_id
  max_allocated_storage                 = var.db_instance_max_allocated_storage
  monitoring_interval                   = var.db_instance_monitoring_interval
  monitoring_role_arn                   = var.db_instance_monitoring_role_arn
  multi_az                              = var.db_instance_multi_az
  name                                  = var.db_instance_name
  nchar_character_set_name              = var.db_instance_nchar_character_set_name
  network_type                          = var.db_instance_network_type
  option_group_name                     = var.db_instance_option_group_name
  parameter_group_name                  = var.db_instance_parameter_group_name
  password                              = var.db_instance_password
  performance_insights_enabled          = var.db_instance_performance_insights_enabled
  performance_insights_kms_key_id       = var.db_instance_performance_insights_kms_key_id
  performance_insights_retention_period = var.db_instance_performance_insights_retention_period
  port                                  = var.db_instance_port
  publicly_accessible                   = var.db_instance_publicly_accessible
  replica_mode                          = var.db_instance_replica_mode
  replicate_source_db                   = var.db_instance_replicate_source_db
  security_group_names                  = var.db_instance_security_group_names
  skip_final_snapshot                   = var.db_instance_skip_final_snapshot
  snapshot_identifier                   = var.db_instance_snapshot_identifier
  storage_encrypted                     = var.db_instance_storage_encrypted
  storage_type                          = var.db_instance_storage_type
  storage_throughput                    = var.db_instance_storage_throughput  
  tags                                  = var.db_instance_tags
  timezone                              = var.db_instance_timezone
  username                              = var.db_instance_username
  vpc_security_group_ids                = var.db_instance_vpc_security_group_ids
  customer_owned_ip_enabled             = var.db_instance_customer_owned_ip_enabled
  
  dynamic "blue_green_update" {
    for_each = var.db_instance_blue_green_update
      content {
        enabled = blue_green_update.value["enabled"]
      }
  }
  dynamic "restore_to_point_in_time" {
    for_each = var.db_instance_restore_to_point_in_time
     content {
       restore_time                             = restore_to_point_in_time.value["restore_time"]
       source_db_instance_automated_backups_arn = restore_to_point_in_time.value["source_db_instance_automated_backups_arn"]
       source_db_instance_identifier            = restore_to_point_in_time.value["source_db_instance_identifier"]
       source_dbi_resource_id                   = restore_to_point_in_time.value["source_dbi_resource_id"]
       use_latest_restorable_time               = restore_to_point_in_time.value["use_latest_restorable_time"]
     }
  }
  dynamic "s3_import" {
    for_each = var.db_instance_s3_import
      content {
        bucket_name           = s3_import.value["bucket_name"]
        bucket_prefix         = s3_import.value["bucket_prefix"]
        ingestion_role        = s3_import.value["ingestion_role"]
        source_engine         = s3_import.value["source_engine"]
        source_engine_version = s3_import.value["source_engine_version"]
      } 
  }
  timeouts {
    create = "40m"
    delete = "80m"
    update = "60m"
  }
}
