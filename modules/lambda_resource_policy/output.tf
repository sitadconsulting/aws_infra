output "lambda_resource_policy_revision_id" {
  description = "Unique identifier for the current revision of the policy"
  value       = element(concat(aws_lambda_resource_policy.lambda_resource_policy.*.revision_id, [""]), 0)
}
