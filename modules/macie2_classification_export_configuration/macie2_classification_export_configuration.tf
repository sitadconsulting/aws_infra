resource "aws_macie2_classification_export_configuration" "macie2_classification_export_configuration" {
  dynamic "s3_destination" {
    for_each = var.macie2_classification_export_configuration_s3_destination
      content {
        bucket_name = s3_destination.value["bucket_name"]
        key_prefix  = s3_destination.value["key_prefix"]
        kms_key_arn = s3_destination.value["kms_key_arn"]
      }
  }
}
