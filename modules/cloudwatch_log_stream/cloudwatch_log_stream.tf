resource "aws_cloudwatch_log_stream" "cloudwatch_log_stream" {
  log_group_name = var.cloudwatch_log_stream_log_group_name
  name           = var.cloudwatch_log_stream_name
}
