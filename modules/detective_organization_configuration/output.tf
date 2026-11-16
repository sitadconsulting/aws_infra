output "detective_organization_configuration_id" {
  description = "Identifier of the Detective behavior graph"
  value       = element(concat(aws_detective_organization_configuration.detective_organization_configuration.*.id, [""]), 0)
}
