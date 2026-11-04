resource "aws_appconfig_application" "appconfig_application" {
  description = var.appconfig_application_description
  name        = var.appconfig_application_name
  tags        = var.appconfig_application_tags
}
