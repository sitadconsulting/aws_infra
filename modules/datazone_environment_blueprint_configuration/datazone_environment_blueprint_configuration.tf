resource "aws_datazone_environment_blueprint_configuration" "datazone_environment_blueprint_configuration" {
  domain_id                = var.datazone_environment_blueprint_configuration_domain_id
  enabled_regions          = var.datazone_environment_blueprint_configuration_enabled_regions
  environment_blueprint_id = var.datazone_environment_blueprint_configuration_environment_blueprint_id
  global_parameters        = var.datazone_environment_blueprint_configuration_global_parameters
  manage_access_role_arn   = var.datazone_environment_blueprint_configuration_manage_access_role_arn
  provisioning_role_arn    = var.datazone_environment_blueprint_configuration_provisioning_role_arn
  regional_parameters      = var.datazone_environment_blueprint_configuration_regional_parameters
}
