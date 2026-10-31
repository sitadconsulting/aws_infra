resource "aws_cloudwatch_log_delivery_source" "cloudwatch_log_delivery_source" {
  log_type     = var.cloudwatch_log_delivery_source_log_type
  name         = var.cloudwatch_log_delivery_source_name
  resource_arn = var.cloudwatch_log_delivery_source_resource_arn
  tags         = var.cloudwatch_log_delivery_source_tags
}
