output "grafana_workspace_service_account_token_service_account_token_id" {
  description = "Identifier of the service account token in the given Grafana workspace"
  value       = element(concat(aws_grafana_workspace_service_account_token.grafana_workspace_service_account_token.*.service_account_token_id, [""]), 0)
}
output "grafana_workspace_service_account_token_created_at" {
  description = "Specifies when the service account token was created"
  value       = element(concat(aws_grafana_workspace_service_account_token.grafana_workspace_service_account_token.*.created_at, [""]), 0)
}
output "grafana_workspace_service_account_token_expires_at" {
  description = "Specifies when the service account token will expire"
  value       = element(concat(aws_grafana_workspace_service_account_token.grafana_workspace_service_account_token.*.expires_at, [""]), 0)
}
output "grafana_workspace_service_account_token_key" {
  description = "The key for the service account token. Used when making calls to the Grafana HTTP APIs to authenticate and authorize the requests"
  value       = element(concat(aws_grafana_workspace_service_account_token.grafana_workspace_service_account_token.*.key, [""]), 0)
}
