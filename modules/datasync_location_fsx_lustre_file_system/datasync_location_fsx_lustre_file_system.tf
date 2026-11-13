resource "aws_datasync_location_fsx_lustre_file_system" "datasync_location_fsx_lustre_file_system" {
  fsx_filesystem_arn  = var.datasync_location_fsx_lustre_file_system_fsx_filesystem_arn
  security_group_arns = var.datasync_location_fsx_lustre_file_system_security_group_arns
  subdirectory        = var.datasync_location_fsx_lustre_file_system_subdirectory
  tags                = var.datasync_location_fsx_lustre_file_system_tags
}
