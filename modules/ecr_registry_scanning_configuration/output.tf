output "ecr_registry_scanning_configuration_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecr_registry_scanning_configuration.ecr_registry_scanning_configuration.*.registry_id, [""]), 0)
}
