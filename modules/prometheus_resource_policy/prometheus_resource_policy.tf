resource "aws_prometheus_resource_policy" "prometheus_resource_policy" {
  policy_document = var.prometheus_resource_policy_policy_document
  workspace_id    = var.prometheus_resource_policy_workspace_id
}
