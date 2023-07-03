output "cloudwatch_log_destination_arn" {
  description = "ARN specifying the log destination"
  value       = element(concat(aws_cloudwatch_log_destination.cloudwatch_log_destination.*.arn, [""]), 0)
}
