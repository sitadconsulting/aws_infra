output "grafana_workspace_saml_configuration_status" {
  description = "The status of the SAML configuration"
  value       = element(concat(aws_grafana_workspace_saml_configuration.grafana_workspace_saml_configuration.*.status, [""]), 0)
}
