output "ecr_pull_through_cache_rule_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecr_pull_through_cache_rule.ecr_pull_through_cache_rule.*.registry_id, [""]), 0)
}
