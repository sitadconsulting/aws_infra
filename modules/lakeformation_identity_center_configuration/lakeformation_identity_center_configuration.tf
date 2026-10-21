resource "aws_lakeformation_identity_center_configuration" "lakeformation_identity_center_configuration" {
  catalog_id    = var.lakeformation_identity_center_configuration_catalog_id
  instance_arn  = var.lakeformation_identity_center_configuration_instance_arn
}
