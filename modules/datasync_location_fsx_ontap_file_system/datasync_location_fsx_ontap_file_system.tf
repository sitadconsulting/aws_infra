resource "aws_datasync_location_fsx_ontap_file_system" "datasync_location_fsx_ontap_file_system" {
  security_group_arns         = var.datasync_location_fsx_ontap_file_system_security_group_arns
  storage_virtual_machine_arn = var.datasync_location_fsx_ontap_file_system_storage_virtual_machine_arn
  subdirectory                = var.datasync_location_fsx_ontap_file_system_subdirectory
  tags                        = var.datasync_location_fsx_ontap_file_system_tags

  dynamic "protocol" {
    for_each = var.datasync_location_fsx_ontap_file_system_protocol
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
        dynamic "smb" {
          for_each = protocol.value.smb
            content {
              domain   = smb.value["domain"]
              password = smb.value["password"]
              user     = smb.value["user"]
              dynamic "mount_options" {
                for_each = smb.value.mount_options
                  content {
                    version = mount_options.value["version"]
                  }
              }
            }
        }
      }
  }
}
