output "inspector2_organization_configuration_max_account_limit_reached" {
  description = "Whether your configuration reached the max account limit"
  value       = element(concat(aws_inspector2_organization_configuration.inspector2_organization_configuration.*.max_account_limit_reached, [""]), 0)
}
