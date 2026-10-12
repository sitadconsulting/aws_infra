resource "aws_prometheus_rule_group_namespace" "prometheus_rule_group_namespace" {
  data         = var.prometheus_rule_group_namespace_data
  name         = var.prometheus_rule_group_namespace_name
  tags         = var.prometheus_rule_group_namespace_tags
  workspace_id = var.prometheus_rule_group_namespace_workspace_id
}
