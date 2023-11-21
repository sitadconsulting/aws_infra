output "ecr_registry_policy_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecr_registry_policy.ecr_registry_policy.*.registry_id, [""]), 0)
}
