resource "aws_datazone_environment" "datazone_environment" {
  account_identifier   = var.datazone_environment_account_identifier
  account_region       = var.datazone_environment_account_region
  blueprint_identifier = var.datazone_environment_blueprint_identifier
  description          = var.datazone_environment_description
  domain_identifier    = var.datazone_environment_domain_identifier
  glossary_terms       = var.datazone_environment_glossary_terms
  name                 = var.datazone_environment_name
  profile_identifier   = var.datazone_environment_profile_identifier
  project_identifier   = var.datazone_environment_project_identifier

  dynamic "user_parameters" {
    for_each = var.datazone_environment_user_parameters
      content {
        name  = user_parameters.value["name"]
        value = user_parameters.value["value"]
      } 
  }
}
