output "cloudwatch_log_group_arn" {
  description = "The ARNs of this cloudwatch log group"
  value       = element(concat(aws_cloudwatch_log_group.cloudwatch_log_group.*.arn, [""]), 0)
}
