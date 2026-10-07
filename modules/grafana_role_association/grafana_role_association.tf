resource "aws_grafana_role_association" "grafana_role_association" {
  group_ids    = var.grafana_role_association_group_ids
  role         = var.grafana_role_association_role
  user_ids     = var.grafana_role_association_user_ids
  workspace_id = var.grafana_role_association_workspace_id
}
