resource "aws_observabilityadmin_s3_table_integration" "observabilityadmin_s3_table_integration" {
  role_arn = var.observabilityadmin_s3_table_integration_role_arn
  tags     = var.observabilityadmin_s3_table_integration_tags

  dynamic "encryption"  {
    for_each = var.observabilityadmin_s3_table_integration_encryption
      content {
        kms_key_arn   = encryption.value["kms_key_arn"] 
        sse_algorithm = encryption.value["sse_algorithm"]
      }
  }
}
