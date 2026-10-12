resource "aws_fsx_lustre_file_system" "fsx_lustre_file_system" {
  auto_import_policy                = var.fsx_lustre_file_system_auto_import_policy
  automatic_backup_retention_days   = var.fsx_lustre_file_system_automatic_backup_retention_days
  backup_id                         = var.fsx_lustre_file_system_backup_id
  copy_tags_to_backups              = var.fsx_lustre_file_system_copy_tags_to_backups
  daily_automatic_backup_start_time = var.fsx_lustre_file_system_daily_automatic_backup_start_time
  data_compression_type             = var.fsx_lustre_file_system_data_compression_type
  deployment_type                   = var.fsx_lustre_file_system_deployment_type
  drive_cache_type                  = var.fsx_lustre_file_system_drive_cache_type
  efa_enabled                       = var.fsx_lustre_file_system_efa_enabled
  export_path                       = var.fsx_lustre_file_system_export_path
  file_system_type_version          = var.fsx_lustre_file_system_file_system_type_version
  final_backup_tags                 = var.fsx_lustre_file_system_final_backup_tags
  import_path                       = var.fsx_lustre_file_system_import_path
  imported_file_chunk_size          = var.fsx_lustre_file_system_imported_file_chunk_size
  kms_key_id                        = var.fsx_lustre_file_system_kms_key_id
  per_unit_storage_throughput       = var.fsx_lustre_file_system_per_unit_storage_throughput
  security_group_ids                = var.fsx_lustre_file_system_security_group_ids
  skip_final_backup                 = var.fsx_lustre_file_system_skip_final_backup
  storage_capacity                  = var.fsx_lustre_file_system_storage_capacity
  storage_type                      = var.fsx_lustre_file_system_storage_type
  subnet_ids                        = var.fsx_lustre_file_system_subnet_ids
  tags                              = var.fsx_lustre_file_system_tags
  throughput_capacity               = var.fsx_lustre_file_system_throughput_capacity
  weekly_maintenance_start_time     = var.fsx_lustre_file_system_weekly_maintenance_start_time
  

  dynamic "data_read_cache_configuration" {
    for_each = var.fsx_lustre_file_system_data_read_cache_configuration
      content {
        size        = data_read_cache_configuration.value["size"]
        sizing_mode = data_read_cache_configuration.value["sizing_mode"]
      }
  }
  dynamic "log_configuration" {
    for_each = var.fsx_lustre_file_system_log_configuration
      content {
        destination = log_configuration.value["destination"]
        level       = log_configuration.value["level"]
      }
  }
  dynamic "metadata_configuration" {
    for_each = var.fsx_lustre_file_system_metadata_configuration
      content {
        mode = metadata_configuration.value["mode"]
        iops = metadata_configuration.value["iops"]
      }
  }
  dynamic "root_squash_configuration" {
    for_each = var.fsx_lustre_file_system_root_squash_configuration
      content {
        no_squash_nids = root_squash_configuration.value["no_squash_nids"]
        root_squash    = root_squash_configuration.value["root_squash"]
      }
  }
}
