output "dynamodb_resource_policy_revision_id" {
  description = "A unique string that represents the revision ID of the policy. If you are comparing revision IDs, make sure to always use string comparison logic"
  value       = element(concat(aws_dynamodb_resource_policy.dynamodb_resource_policy.*.revision_id, [""]), 0)
}
