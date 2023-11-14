resource "aws_cognito_identity_pool" "cognito_identity_pool" {
  identity_pool_name               = var.cognito_identity_pool_identity_pool_name
  developer_provider_name          = var.cognito_identity_pool_developer_provider_name
  allow_unauthenticated_identities = var.cognito_identity_pool_allow_unauthenticated_identities 
  allow_classic_flow               = var.cognito_identity_pool_allow_classic_flow
  openid_connect_provider_arns     = var.cognito_identity_pool_openid_connect_provider_arns
  saml_provider_arns               = var.cognito_identity_pool_saml_provider_arns
  supported_login_providers        = var.cognito_identity_pool_supported_login_providers
  tags                             = var.cognito_identity_pool_tags

  dynamic "cognito_identity_providers" {
    for_each = var.cognito_identity_pool_cognito_identity_providers
      content {
        client_id                = cognito_identity_providers.value["client_id"]
        provider_name            = cognito_identity_providers.value["provider_name"]
        server_side_token_check  = cognito_identity_providers.value["server_side_token_check"] 
      }
  }
}
