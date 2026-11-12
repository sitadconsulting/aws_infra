resource "aws_dms_replication_config" "dms_replication_config" {
  replication_config_identifier = var.dms_replication_config_replication_config_identifier
  replication_settings          = var.dms_replication_config_replication_settings
  replication_type              = var.dms_replication_config_replication_type
  resource_identifier           = var.dms_replication_config_resource_identifier
  source_endpoint_arn           = var.dms_replication_config_source_endpoint_arn
  start_replication             = var.dms_replication_config_start_replication
  supplemental_settings         = var.dms_replication_config_supplemental_settings
  table_mappings                = var.dms_replication_config_table_mappings
  tags                          = var.dms_replication_config_tags
  target_endpoint_arn           = var.dms_replication_config_target_endpoint_arn


  dynamic "compute_config" {
    for_each = var.dms_replication_config_compute_config
      content {
        availability_zone            = compute_config.value["availability_zone"]
        dns_name_servers             = compute_config.value["dns_name_servers"]
        kms_key_id                   = compute_config.value["kms_key_id"]
        max_capacity_units           = compute_config.value["max_capacity_units"]
        min_capacity_units           = compute_config.value["min_capacity_units"]
        multi_az                     = compute_config.value["multi_az"]
        preferred_maintenance_window = compute_config.value["preferred_maintenance_window"]
        replication_subnet_group_id  = compute_config.value["replication_subnet_group_id"]
        vpc_security_group_ids       = compute_config.value["vpc_security_group_ids"]
      }
  }
}
