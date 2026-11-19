output "cloudwatch_event_endpoint_arn" {
  description = "The ARN of the endpoint that was created"
  value       = element(concat(aws_cloudwatch_event_endpoint.cloudwatch_event_endpoint.*.arn, [""]), 0)
}
output "cloudwatch_event_endpoint_endpoint_url" {
  description = "The URL of the endpoint that was created"
  value       = element(concat(aws_cloudwatch_event_endpoint.cloudwatch_event_endpoint.*.endpoint_url, [""]), 0)
}
