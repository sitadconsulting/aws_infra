resource "aws_cloudwatch_log_delivery" "cloudwatch_log_delivery" {
  delivery_destination_arn = var.cloudwatch_log_delivery_delivery_destination_arn
  delivery_source_name     = var.cloudwatch_log_delivery_delivery_source_name
  field_delimiter          = var.cloudwatch_log_delivery_field_delimiter
  record_fields            = var.cloudwatch_log_delivery_record_fields
  tags                     = var.cloudwatch_log_delivery_tags

  dynamic "s3_delivery_configuration" {
    for_each = var.cloudwatch_log_delivery_s3_delivery_configuration
      content {
        enable_hive_compatible_path = s3_delivery_configuration.value["enable_hive_compatible_path"]
        suffix_path                 = s3_delivery_configuration.value["suffix_path"]
      }
  }
}
