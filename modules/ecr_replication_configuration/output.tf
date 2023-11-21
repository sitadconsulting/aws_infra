output "ecr_replication_configuration_registry_id" {
  description = "The registry ID where the repository was created"
  value       = element(concat(aws_ecr_replication_configuration.ecr_replication_configuration.*.registry_id, [""]), 0)
}
