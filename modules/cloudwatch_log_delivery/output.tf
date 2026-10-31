output "cloudwatch_log_delivery_arn" {
  description = "ARN of the delivery"
  value       = element(concat(aws_cloudwatch_log_delivery.cloudwatch_log_delivery.*.arn, [""]), 0)
}
output "cloudwatch_log_delivery_id" {
  description = "The unique ID that identifies this delivery in your account"
  value       = element(concat(aws_cloudwatch_log_delivery.cloudwatch_log_delivery.*.id, [""]), 0)
}
