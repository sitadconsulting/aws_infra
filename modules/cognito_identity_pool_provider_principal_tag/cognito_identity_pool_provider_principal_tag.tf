resource "aws_cognito_identity_pool_provider_principal_tag" "cognito_identity_pool_provider_principal_tag" {
  identity_pool_id       = var.cognito_identity_pool_provider_principal_tag_identity_pool_id
  identity_provider_name = var.cognito_identity_pool_provider_principal_tag_identity_provider_name
  principal_tags         = var.cognito_identity_pool_provider_principal_tag_principal_tags
  use_defaults           = var.cognito_identity_pool_provider_principal_tag_use_defaults
}
