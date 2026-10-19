resource "aws_organizations_organization" "organizations_organization" {
  enabled_features = var.organizations_organization_enabled_features
}
