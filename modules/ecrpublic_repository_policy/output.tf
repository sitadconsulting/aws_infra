output "ecrpublic_repository_policy_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecrpublic_repository_policy.ecrpublic_repository_policy.*.registry_id, [""]), 0)
}
