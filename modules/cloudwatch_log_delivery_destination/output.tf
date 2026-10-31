output "cloudwatch_log_delivery_destination_arn" {
  description = "ARN of the delivery destination"
  value       = element(concat(aws_cloudwatch_log_delivery_destination.cloudwatch_log_delivery_destination.*.arn, [""]), 0)
}
