resource "aws_lakeformation_resource" "lakeformation_resource" {
  arn                     = var.lakeformation_resource_arn
  role_arn                = var.lakeformation_resource_role_arn
  use_service_linked_role = var.lakeformation_resource_use_service_linked_role
  hybrid_access_enabled   = var.lakeformation_resource_hybrid_access_enabled
  with_federation         = var.lakeformation_resource_with_federation
  with_privileged_access  = var.lakeformation_resource_with_privileged_access
}
