resource "aws_appconfig_configuration_profile" "appconfig_configuration_profile" {
  application_id     = var.appconfig_configuration_profile_application_id
  description        = var.appconfig_configuration_profile_description
  kms_key_identifier = var.appconfig_configuration_profile_kms_key_identifier
  location_uri       = var.appconfig_configuration_profile_location_uri
  name               = var.appconfig_configuration_profile_name
  retrieval_role_arn = var.appconfig_configuration_profile_retrieval_role_arn
  tags               = var.appconfig_configuration_profile_tags
  type               = var.appconfig_configuration_profile_type

  dynamic "validator" {
    for_each = var.appconfig_configuration_profile_validator
      content {
        content = validator.value["content"]
        type    = validator.value["type"]
      }
  }
}
