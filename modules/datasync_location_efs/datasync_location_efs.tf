resource "aws_datasync_location_efs" "datasync_location_efs" {
  access_point_arn            = var.datasync_location_efs_access_point_arn
  efs_file_system_arn         = var.datasync_location_efs_efs_file_system_arn
  file_system_access_role_arn = var.datasync_location_efs_file_system_access_role_arn
  in_transit_encryption       = var.datasync_location_efs_in_transit_encryption
  subdirectory                = var.datasync_location_efs_subdirectory
  tags                        = var.datasync_location_efs_tags

  dynamic "ec2_config" {
    for_each = var.datasync_location_efs_ec2_config
      content {
        security_group_arns = ec2_config.value["security_group_arns"]
        subnet_arn          = ec2_config.value["subnet_arn"]
      }
  }
}
