resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_server_side_encryption_configuration" {
  bucket                = var.s3_bucket_server_side_encryption_configuration_bucket
  expected_bucket_owner = var.s3_bucket_server_side_encryption_configuration_expected_bucket_owner 

  dynamic "rule" {
    for_each = var.s3_bucket_server_side_encryption_configuration_rule
      content {
        bucket_key_enabled = rule.value["bucket_key_enabled"]
        dynamic "apply_server_side_encryption_by_default" {
          for_each = rule.value.apply_server_side_encryption_by_default
            content {
              kms_master_key_id = apply_server_side_encryption_by_default.value["kms_master_key_id"]
              sse_algorithm     = apply_server_side_encryption_by_default.value["sse_algorithm"]
            }
        }
      }
  }
}
