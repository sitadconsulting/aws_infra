resource "aws_datasync_location_fsx_openzfs_file_system" "datasync_location_fsx_openzfs_file_system" {
  fsx_filesystem_arn  = var.datasync_location_fsx_openzfs_file_system_fsx_filesystem_arn
  security_group_arns = var.datasync_location_fsx_openzfs_file_system_security_group_arns
  subdirectory        = var.datasync_location_fsx_openzfs_file_system_subdirectory
  tags                = var.datasync_location_fsx_openzfs_file_system_tags

  dynamic "protocol" {
    for_each = var.datasync_location_fsx_openzfs_file_system_protocol
      content {
        dynamic "nfs" {
          for_each = protocol.value.nfs
            content {
              dynamic "mount_options" {
                for_each = nfs.value.mount_options
                  content {
                    version = mount_options.value["version"]
                  }
              }
            }
        }
      }
  }
}
