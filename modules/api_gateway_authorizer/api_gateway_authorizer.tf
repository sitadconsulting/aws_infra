resource "aws_api_gateway_authorizer" "api_gateway_authorizer" {
  authorizer_credentials           = var.api_gateway_authorizer_authorizer_credentials
  authorizer_result_ttl_in_seconds = var.api_gateway_authorizer_authorizer_result_ttl_in_seconds 
  authorizer_uri                   = var.api_gateway_authorizer_authorizer_uri
  identity_source                  = var.api_gateway_authorizer_identity_source
  identity_validation_expression   = var.api_gateway_authorizer_identity_validation_expression
  name                             = var.api_gateway_authorizer_name
  provider_arns                    = var.api_gateway_authorizer_provider_arns
  rest_api_id                      = var.api_gateway_authorizer_rest_api_id
  type                             = var.api_gateway_authorizer_type
}
