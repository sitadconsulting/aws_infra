output "cloudwatch_log_group_arn" {
  description = "The ARNs of this cloudwatch log group"
  value       = element(concat(aws_cloudwatch_log_group.cloudwatch_log_group.*.arn, [""]), 0)
}
output "cloudwatch_log_group_name" {
  description = "Cloudwatch log group name"
  value       = element(concat(split(":",aws_cloudwatch_log_group.cloudwatch_log_group.arn), [""]), 6)
}
