resource "aws_cognito_identity_provider" "cognito_identity_provider" {
  attribute_mapping = var.cognito_identity_provider_attribute_mapping
  idp_identifiers   = var.cognito_identity_provider_idp_identifiers
  provider_details  = var.cognito_identity_provider_provider_details
  provider_name     = var.cognito_identity_provider_provider_name
  provider_type     = var.cognito_identity_provider_provider_type
  user_pool_id      = var.cognito_identity_provider_user_pool_id
}
