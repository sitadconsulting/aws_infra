resource "aws_datasync_location_s3" "datasync_location_s3" {
  agent_arns       = var.datasync_location_s3_agent_arns
  s3_bucket_arn    = var.datasync_location_s3_s3_bucket_arn
  s3_storage_class = var.datasync_location_s3_s3_storage_class
  subdirectory     = var.datasync_location_s3_subdirectory
  tags             = var.datasync_location_s3_tags

  dynamic "s3_config" {
    for_each = var.datasync_location_s3_s3_config
      content {
        bucket_access_role_arn = s3_config.value["bucket_access_role_arn"]
      }
  }
}
