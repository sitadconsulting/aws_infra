output "cloudwatch_log_resource_policy_id" {
  description = "The name of the CloudWatch log resource policy when resource_arn is not specified, or the ARN of the CloudWatch log group when resource_arn is specified"
  value       = element(concat(aws_cloudwatch_log_resource_policy.cloudwatch_log_resource_policy.*.id, [""]), 0)
}
output "cloudwatch_log_resource_policy_policy_scope" {
  description = "Scope of the resource policy (ACCOUNT or RESOURCE)"
  value       = element(concat(aws_cloudwatch_log_resource_policy.cloudwatch_log_resource_policy.*.policy_scope, [""]), 0)
}
output "cloudwatch_log_resource_policy_revision_id" {
  description = "Revision ID of the resource policy. Only populated for resource-scoped policies"
  value       = element(concat(aws_cloudwatch_log_resource_policy.cloudwatch_log_resource_policy.*.revision_id, [""]), 0)
}
