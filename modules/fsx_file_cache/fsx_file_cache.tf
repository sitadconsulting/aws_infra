resource "aws_fsx_file_cache" "fsx_file_cache" {
  copy_tags_to_data_repository_associations = var.fsx_file_cache_copy_tags_to_data_repository_associations
  file_cache_type                           = var.fsx_file_cache_file_cache_type 
  file_cache_type_version                   = var.fsx_file_cache_file_cache_type_version
  kms_key_id                                = var.fsx_file_cache_kms_key_id 
  security_group_ids                        = var.fsx_file_cache_security_group_ids 
  storage_capacity                          = var.fsx_file_cache_storage_capacity
  subnet_ids                                = var.fsx_file_cache_subnet_ids
  tags                                      = var.fsx_file_cache_tags 

  dynamic "data_repository_association" {
    for_each = var.fsx_file_cache_data_repository_association
      content {
        data_repository_path           = data_repository_association.value["data_repository_path"]
        data_repository_subdirectories = data_repository_association.value["data_repository_subdirectories"]
        file_cache_path                = data_repository_association.value["file_cache_path"]
        dynamic "nfs" {
          for_each = data_repository_association.value.nfs
            content {
              dns_ips = nfs.value["dns_ips"]
              version = nfs.value["version"] 
            }
        }
      }
  }
  dynamic "lustre_configuration" {
    for_each = var.fsx_file_cache_lustre_configuration
      content {
        deployment_type               = lustre_configuration.value["deployment_type"]
        per_unit_storage_throughput   = lustre_configuration.value["per_unit_storage_throughput"]
        weekly_maintenance_start_time = lustre_configuration.value["weekly_maintenance_start_time"]
        dynamic "metadata_configuration" {
          for_each = lustre_configuration.value.metadata_configuration
            content {
              storage_capacity = metadata_configuration.value["storage_capacity"]
            }
        }
      }
  }
}
