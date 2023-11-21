resource "aws_efs_replication_configuration" "efs_replication_configuration" {
  source_file_system_id = var.efs_replication_configuration_source_file_system_id

  dynamic "destination" {
    for_each = var.efs_replication_configuration_destination
      content {
        availability_zone_name = destination.value["availability_zone_name"]
        kms_key_id             = destination.value["kms_key_id"]
        region                 = destination.value["region"]
      }
  }
}
