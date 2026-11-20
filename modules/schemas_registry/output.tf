output "schemas_registry_arn" {
  description = "ARN of the registry"
  value       = element(concat(aws_schemas_registry.schemas_registry.*.arn, [""]), 0)
}
