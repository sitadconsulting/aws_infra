resource "aws_cloudwatch_event_api_destination" "cloudwatch_event_api_destination" {
  connection_arn                   = var.cloudwatch_event_api_destination_connection_arn
  description                      = var.cloudwatch_event_api_destination_description
  http_method                      = var.cloudwatch_event_api_destination_http_method
  invocation_endpoint              = var.cloudwatch_event_api_destination_invocation_endpoint
  invocation_rate_limit_per_second = var.cloudwatch_event_api_destination_invocation_rate_limit_per_second
}
