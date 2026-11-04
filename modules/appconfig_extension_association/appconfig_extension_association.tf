resource "aws_appconfig_extension_association" "appconfig_extension_association" {
  extension_arn = var.appconfig_extension_association_extension_arn
  parameters    = var.appconfig_extension_association_parameters
  resource_arn  = var.appconfig_extension_association_resource_arn
}
