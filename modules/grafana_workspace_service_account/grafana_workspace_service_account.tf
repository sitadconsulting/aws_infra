resource "aws_grafana_workspace_service_account" "grafana_workspace_service_account" {
  grafana_role = var.grafana_workspace_service_account_grafana_role
  name         = var.grafana_workspace_service_account_name
  workspace_id = var.grafana_workspace_service_account_workspace_id
}
