resource "aws_grafana_license_association" "grafana_license_association" {
  grafana_token = var.grafana_license_association_grafana_token
  license_type  = var.grafana_license_association_license_type
  workspace_id  = var.grafana_license_association_workspace_id
}
