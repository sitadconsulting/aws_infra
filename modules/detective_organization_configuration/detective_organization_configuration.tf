resource "aws_detective_organization_configuration" "detective_organization_configuration" {
  auto_enable = var.detective_organization_configuration_auto_enable
  graph_arn   = var.detective_organization_configuration_graph_arn
}
