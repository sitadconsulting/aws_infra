resource "aws_config_delivery_channel" "config_delivery_channel" {
  name           = var.config_delivery_channel_name
  s3_bucket_name = var.config_delivery_channel_s3_bucket_name
  s3_key_prefix  = var.config_delivery_channel_s3_key_prefix
  s3_kms_key_arn = var.config_delivery_channel_s3_kms_key_arn
  sns_topic_arn  = var.config_delivery_channel_sns_topic_arn

  dynamic "snapshot_delivery_properties" {
    for_each = var.config_delivery_channel_snapshot_delivery_properties
      content {
        delivery_frequency = snapshot_delivery_properties.value["delivery_frequency"]
      }
  }
}
