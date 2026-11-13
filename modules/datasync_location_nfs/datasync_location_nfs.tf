resource "aws_datasync_location_nfs" "datasync_location_nfs" {
  server_hostname = var.datasync_location_nfs_server_hostname
  subdirectory    = var.datasync_location_nfs_subdirectory
  tags            = var.datasync_location_nfs_tags

  dynamic "mount_options" {
    for_each = var.datasync_location_nfs_mount_options
      content {
        version = mount_options.value["version"]
      }
  }
  dynamic "on_prem_config" {
    for_each = var.datasync_location_nfs_on_prem_config
      content {
        agent_arns = on_prem_config.value["agent_arns"]  
      }
  }
}
