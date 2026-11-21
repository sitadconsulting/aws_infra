resource "aws_inspector2_enabler" "inspector2_enabler" {
  account_ids    = var.inspector2_enabler_account_ids
  resource_types = var.inspector2_enabler_resource_types
}
