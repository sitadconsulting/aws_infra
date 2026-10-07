resource "aws_grafana_workspace_api_key" "grafana_workspace_api_key" {
  key_name        = var.grafana_workspace_api_key_key_name
  key_role        = var.grafana_workspace_api_key_key_role
  seconds_to_live = var.grafana_workspace_api_key_seconds_to_live
  workspace_id    = var.grafana_workspace_api_key_workspace_id
}
