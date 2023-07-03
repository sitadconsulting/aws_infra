output "redshift_usage_limit_arn" {
  description = "ARN of the Redshift Usage Limit"
  value       = element(concat(aws_redshift_usage_limit.redshift_usage_limit.*.arn, [""]), 0)
}
output "redshift_usage_limit_id" {
  description = "Redshift Usage Limit ID"
  value       = element(concat(aws_redshift_usage_limit.redshift_usage_limit.*.id, [""]), 0)
}
