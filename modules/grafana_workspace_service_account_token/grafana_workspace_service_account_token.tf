resource "aws_grafana_workspace_service_account_token" "grafana_workspace_service_account_token" {
  name               = var.grafana_workspace_service_account_token_name
  seconds_to_live    = var.grafana_workspace_service_account_token_seconds_to_live
  service_account_id = var.grafana_workspace_service_account_token_service_account_id
  workspace_id       = var.grafana_workspace_service_account_token_workspace_id
}
