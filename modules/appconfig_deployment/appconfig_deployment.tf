resource "aws_appconfig_deployment" "appconfig_deployment" {
  application_id           = var.appconfig_deployment_application_id
  configuration_profile_id = var.appconfig_deployment_configuration_profile_id
  configuration_version    = var.appconfig_deployment_configuration_version
  deployment_strategy_id   = var.appconfig_deployment_deployment_strategy_id
  description              = var.appconfig_deployment_description
  environment_id           = var.appconfig_deployment_environment_id
  kms_key_identifier       = var.appconfig_deployment_kms_key_identifier
  tags                     = var.appconfig_deployment_tags
}
