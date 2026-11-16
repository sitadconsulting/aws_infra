resource "aws_datazone_environment_profile" "datazone_environment_profile" {
  aws_account_id                   = var.datazone_environment_profile_aws_account_id
  aws_account_region               = var.datazone_environment_profile_aws_account_region
  description                      = var.datazone_environment_profile_description
  domain_identifier                = var.datazone_environment_profile_domain_identifier
  environment_blueprint_identifier = var.datazone_environment_profile_environment_blueprint_identifier
  name                             = var.datazone_environment_profile_name
  project_identifier               = var.datazone_environment_profile_project_identifier

  dynamic "user_parameters" {
    for_each = var.datazone_environment_profile_user_parameters
      content {
        name  = user_parameters.value["name"] 
        value = user_parameters.value["value"]
      }
  }
}
