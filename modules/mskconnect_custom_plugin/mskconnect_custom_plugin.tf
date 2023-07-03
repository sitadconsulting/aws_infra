resource "aws_mskconnect_custom_plugin" "mskconnect_custom_plugin" {
  content_type = var.mskconnect_custom_plugin_content_type
  description  = var.mskconnect_custom_plugin_description
  name         = var.mskconnect_custom_plugin_name

  dynamic "location" {
    for_each = var.mskconnect_custom_plugin_location
      content {
        dynamic "s3" {
          for_each = location.value.s3
            content {
              bucket_arn     = s3.value["bucket_arn"]
              file_key       = s3.value["file_key"]
              object_version = s3.value["object_version"]
            }
        }
      }
  }
}
