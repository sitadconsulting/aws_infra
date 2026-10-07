output "grafana_workspace_api_key_key" {
  description = "The key token in JSON format. Use this value as a bearer token to authenticate HTTP requests to the workspace"
  value       = element(concat(aws_grafana_workspace_api_key.grafana_workspace_api_key.*.key, [""]), 0)
}
