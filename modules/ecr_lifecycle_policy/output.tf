output "ecr_lifecycle_policy_repository" {
  description = "Repository name"
  value       = element(concat(aws_ecr_lifecycle_policy.ecr_lifecycle_policy.*.repository, [""]), 0)
}
output "ecr_lifecycle_policy_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecr_lifecycle_policy.ecr_lifecycle_policy.*.registry_id, [""]), 0)
}
