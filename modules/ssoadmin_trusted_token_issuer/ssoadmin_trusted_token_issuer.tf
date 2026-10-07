resource "aws_ssoadmin_trusted_token_issuer" "ssoadmin_trusted_token_issuer" {
  client_token              = var.ssoadmin_trusted_token_issuer_client_token
  instance_arn              = var.ssoadmin_trusted_token_issuer_instance_arn
  name                      = var.ssoadmin_trusted_token_issuer_name
  tags                      = var.ssoadmin_trusted_token_issuer_tags
  trusted_token_issuer_type = var.ssoadmin_trusted_token_issuer_trusted_token_issuer_type

  dynamic "trusted_token_issuer_configuration" {
    for_each = var.ssoadmin_trusted_token_issuer_trusted_token_issuer_configuration
      content {
        dynamic "oidc_jwt_configuration" {
          for_each = trusted_token_issuer_configuration.value.oidc_jwt_configuration
            content {
              claim_attribute_path          = oidc_jwt_configuration.value["claim_attribute_path"]
              identity_store_attribute_path = oidc_jwt_configuration.value["identity_store_attribute_path"]
              issuer_url                    = oidc_jwt_configuration.value["issuer_url"]
              jwks_retrieval_option         = oidc_jwt_configuration.value["jwks_retrieval_option"]
            }
        }
     }
  }
}
