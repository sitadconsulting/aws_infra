output "grafana_workspace_service_account_service_account_id" {
  description = "Identifier of the service account in the given Grafana workspace"
  value       = element(concat(aws_grafana_workspace_service_account.grafana_workspace_service_account.*.service_account_id, [""]), 0)
}
