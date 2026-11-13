resource "aws_datasync_location_smb" "datasync_location_smb" {
  agent_arns      = var.datasync_location_smb_agent_arns
  domain          = var.datasync_location_smb_domain
  password        = var.datasync_location_smb_password
  server_hostname = var.datasync_location_smb_server_hostname
  subdirectory    = var.datasync_location_smb_subdirectory
  tags            = var.datasync_location_smb_tags
  user            = var.datasync_location_smb_user
 
  dynamic "mount_options" {
    for_each = var.datasync_location_smb_mount_options
      content {
        version = mount_options.value["version"]
      }
  }
}
