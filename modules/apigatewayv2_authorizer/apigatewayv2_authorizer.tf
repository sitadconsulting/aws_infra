resource "aws_apigatewayv2_authorizer" "apigatewayv2_authorizer" {
  api_id                            = var.apigatewayv2_authorizer_api_id
  authorizer_credentials_arn        = var.apigatewayv2_authorizer_authorizer_credentials_arn
  authorizer_payload_format_version = var.apigatewayv2_authorizer_authorizer_payload_format_version 
  authorizer_result_ttl_in_seconds  = var.apigatewayv2_authorizer_authorizer_result_ttl_in_seconds
  authorizer_type                   = var.apigatewayv2_authorizer_authorizer_type
  authorizer_uri                    = var.apigatewayv2_authorizer_authorizer_uri
  enable_simple_responses           = var.apigatewayv2_authorizer_enable_simple_responses
  identity_sources                  = var.apigatewayv2_authorizer_identity_sources
  name                              = var.apigatewayv2_authorizer_name
  
  dynamic "jwt_configuration" {
    for_each = var.apigatewayv2_authorizer_jwt_configuration
      content {
        audience = jwt_configuration.value["audience"]
        issuer   = jwt_configuration.value["issuer"]

      }
  }
  
}
