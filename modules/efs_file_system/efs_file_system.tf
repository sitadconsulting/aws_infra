resource "aws_efs_file_system" "efs_file_system" {
  availability_zone_name          = var.efs_file_system_availability_zone_name
  creation_token                  = var.efs_file_system_creation_token
  encrypted                       = var.efs_file_system_encrypted
  kms_key_id                      = var.efs_file_system_kms_key_id
  performance_mode                = var.efs_file_system_performance_mode
  provisioned_throughput_in_mibps = var.efs_file_system_provisioned_throughput_in_mibps
  tags                            = var.efs_file_system_tags
  throughput_mode                 = var.efs_file_system_throughput_mode
   
  
  dynamic "lifecycle_policy" {
    for_each = var.efs_file_system_lifecycle_policy
      content {
        transition_to_ia                    = lifecycle_policy.value["transition_to_ia"]
        transition_to_primary_storage_class = lifecycle_policy.value["transition_to_primary_storage_class"]
      }
  }
}
