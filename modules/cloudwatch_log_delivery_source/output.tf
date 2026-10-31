output "cloudwatch_log_delivery_source_arn" {
  description = "ARN of the delivery source"
  value       = element(concat(aws_cloudwatch_log_delivery_source.cloudwatch_log_delivery_source.*.arn, [""]), 0)
}
output "cloudwatch_log_delivery_source_service" {
  description = "The AWS service that is sending logs"
  value       = element(concat(aws_cloudwatch_log_delivery_source.cloudwatch_log_delivery_source.*.service, [""]), 0)
}
