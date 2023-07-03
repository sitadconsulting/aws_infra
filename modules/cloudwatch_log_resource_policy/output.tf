output "cloudwatch_log_resource_policy_id" {
  description = "The name of the CloudWatch log resource policy"
  value       = element(concat(aws_cloudwatch_log_resource_policy.cloudwatch_log_resource_policy.*.id, [""]), 0)
}
