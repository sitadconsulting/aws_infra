resource "aws_cognito_user_pool_client" "cognito_user_pool_client" {
  access_token_validity                         = var.cognito_user_pool_client_access_token_validity
  allowed_oauth_flows                           = var.cognito_user_pool_client_allowed_oauth_flows
  allowed_oauth_flows_user_pool_client          = var.cognito_user_pool_client_allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes                          = var.cognito_user_pool_client_allowed_oauth_scopes
  auth_session_validity                         = var.cognito_user_pool_client_auth_session_validity
  callback_urls                                 = var.cognito_user_pool_client_callback_urls
  default_redirect_uri                          = var.cognito_user_pool_client_default_redirect_uri
  enable_propagate_additional_user_context_data = var.cognito_user_pool_client_enable_propagate_additional_user_context_data
  enable_token_revocation                       = var.cognito_user_pool_client_enable_token_revocation
  explicit_auth_flows                           = var.cognito_user_pool_client_explicit_auth_flows
  generate_secret                               = var.cognito_user_pool_client_generate_secret
  id_token_validity                             = var.cognito_user_pool_client_id_token_validity
  logout_urls                                   = var.cognito_user_pool_client_logout_urls
  name                                          = var.cognito_user_pool_client_name
  prevent_user_existence_errors                 = var.cognito_user_pool_client_prevent_user_existence_errors
  read_attributes                               = var.cognito_user_pool_client_read_attributes
  refresh_token_validity                        = var.cognito_user_pool_client_refresh_token_validity
  supported_identity_providers                  = var.cognito_user_pool_client_supported_identity_providers
  user_pool_id                                  = var.cognito_user_pool_client_user_pool_id
  write_attributes                              = var.cognito_user_pool_client_write_attributes
  

  dynamic "analytics_configuration" {
    for_each = var.cognito_user_pool_client_analytics_configuration
      content {
        application_arn  = analytics_configuration.value["application_arn"]
        application_id   = analytics_configuration.value["application_id"]
        external_id      = analytics_configuration.value["external_id"]
        role_arn         = analytics_configuration.value["role_arn"]
        user_data_shared = analytics_configuration.value["user_data_shared"] 
      }
  } 
  dynamic "token_validity_units" {
    for_each = var.cognito_user_pool_client_token_validity_units
      content {
        access_token  = token_validity_units.value["access_token"]
        id_token      = token_validity_units.value["id_token"]
        refresh_token = token_validity_units.value["refresh_token"]
      }
  }
}
