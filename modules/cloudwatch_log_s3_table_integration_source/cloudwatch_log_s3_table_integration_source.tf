resource "aws_cloudwatch_log_s3_table_integration_source" "cloudwatch_log_s3_table_integration_source" {
  integration_arn = var.cloudwatch_log_s3_table_integration_source_integration_arn

  dynamic "data_source" {
    for_each = var.cloudwatch_log_s3_table_integration_source_data_source
      content {
        name = data_source.value["name"]
        type = data_source.value["type"]
      }
  }
}
