resource "aws_prometheus_alert_manager_definition" "prometheus_alert_manager_definition" {
  definition   = var.prometheus_alert_manager_definition_definition
  workspace_id = var.prometheus_alert_manager_definition_workspace_id
}
