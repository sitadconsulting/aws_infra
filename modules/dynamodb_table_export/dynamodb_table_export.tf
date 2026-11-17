resource "aws_dynamodb_table_export" "dynamodb_table_export" {
  export_format     = var.dynamodb_table_export_export_format
  export_time       = var.dynamodb_table_export_export_time
  export_type       = var.dynamodb_table_export_export_type
  s3_bucket         = var.dynamodb_table_export_s3_bucket
  s3_bucket_owner   = var.dynamodb_table_export_s3_bucket_owner
  s3_prefix         = var.dynamodb_table_export_s3_prefix
  s3_sse_algorithm  = var.dynamodb_table_export_s3_sse_algorithm
  s3_sse_kms_key_id = var.dynamodb_table_export_s3_sse_kms_key_id
  table_arn         = var.dynamodb_table_export_table_arn
  
  dynamic "incremental_export_specification" {
    for_each = var.dynamodb_table_export_incremental_export_specification
      content {
        export_from_time = incremental_export_specification.value["export_from_time"]
        export_to_time   = incremental_export_specification.value["export_to_time"]
        export_view_type = incremental_export_specification.value["export_view_type"]
      }
  }
}
