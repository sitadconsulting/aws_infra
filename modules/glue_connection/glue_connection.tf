resource "aws_glue_connection" "glue_connection" {
  athena_properties     = var.glue_connection_athena_properties
  catalog_id            = var.glue_connection_catalog_id
  connection_properties = var.glue_connection_connection_properties
  connection_type       = var.glue_connection_connection_type
  description           = var.glue_connection_description
  match_criteria        = var.glue_connection_match_criteria
  name                  = var.glue_connection_name
  tags                  = var.glue_connection_tags
  
  dynamic "authentication_configuration" {
    for_each = var.glue_connection_authentication_configuration
      content {
        authentication_type               = authentication_configuration.value["authentication_type"]
        custom_authentication_credentials = authentication_configuration.value["custom_authentication_credentials"]
        kms_key_arn                       = authentication_configuration.value["kms_key_arn"]
        secret_arn                        = authentication_configuration.value["secret_arn"]
        dynamic "basic_authentication_credentials" {
          for_each = authentication_configuration.value.basic_authentication_credentials
            content {
              password = basic_authentication_credentials.value["password"]
              username = basic_authentication_credentials.value["username"]
            }
        }
        dynamic "oauth2_properties" {
          for_each = authentication_configuration.value.oauth2_properties
            content {
              oauth2_grant_type        = oauth2_properties.value["oauth2_grant_type"]
              token_url                = oauth2_properties.value["token_url"]
              token_url_parameters_map = oauth2_properties.value["token_url_parameters_map"]
              dynamic "authorization_code_properties" {
                for_each = oauth2_properties.value.authorization_code_properties
                  content {
                    authorization_code = authorization_code_properties.value["authorization_code"]
                    redirect_uri       = authorization_code_properties.value["redirect_uri"]
                  }
              }
              dynamic "oauth2_client_application" {
                for_each = oauth2_properties.value.oauth2_client_application
                  content {
                    aws_managed_client_application_reference  = oauth2_client_application.value["aws_managed_client_application_reference"]
                    user_managed_client_application_client_id = oauth2_client_application.value["user_managed_client_application_client_id"]
                  }
              }
              dynamic "oauth2_credentials" {
                for_each = oauth2_properties.value.oauth2_credentials
                  content {
                    access_token                                  = oauth2_credentials.value["access_token"]
                    jwt_token                                     = oauth2_credentials.value["jwt_token"]
                    refresh_token                                 = oauth2_credentials.value["refresh_token"]
                    user_managed_client_application_client_secret = oauth2_credentials.value["user_managed_client_application_client_secret"]
                  }
              }
            }
        }
      }
  }
  dynamic "physical_connection_requirements" {
    for_each = var.glue_connection_physical_connection_requirements
      content {
        availability_zone      = physical_connection_requirements.value["availability_zone"]
        security_group_id_list = physical_connection_requirements.value["security_group_id_list"]
        subnet_id              = physical_connection_requirements.value["subnet_id"]
      }
  }
}
