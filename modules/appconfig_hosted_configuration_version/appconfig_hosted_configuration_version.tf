resource "aws_appconfig_hosted_configuration_version" "appconfig_hosted_configuration_version" {
  application_id           = var.appconfig_hosted_configuration_version_application_id
  configuration_profile_id = var.appconfig_hosted_configuration_version_configuration_profile_id
  content                  = var.appconfig_hosted_configuration_version_content
  content_type             = var.appconfig_hosted_configuration_version_content_type
  description              = var.appconfig_hosted_configuration_version_description
  version_label            = var.appconfig_hosted_configuration_version_version_label
}
