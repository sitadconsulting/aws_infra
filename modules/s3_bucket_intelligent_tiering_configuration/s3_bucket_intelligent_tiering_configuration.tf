resource "aws_s3_bucket_intelligent_tiering_configuration" "s3_bucket_intelligent_tiering_configuration" {
  bucket = var.s3_bucket_intelligent_tiering_configuration_bucket
  name   = var.s3_bucket_intelligent_tiering_configuration_name
  status = var.s3_bucket_intelligent_tiering_configuration_status

  dynamic "filter" {
    for_each = var.s3_bucket_intelligent_tiering_configuration_filter
      content {
        prefix = filter.value["prefix"]
        tags   = filter.value["tags"]
      }
  }
  dynamic "tiering" {
    for_each = var.s3_bucket_intelligent_tiering_configuration_tiering
      content {
        access_tier = tiering.value["access_tier"]
        days        = tiering.value["days"]
      }
  }
}
