resource "aws_apigatewayv2_api" "apigatewayv2_api" {
  api_key_selection_expression = var.apigatewayv2_api_api_key_selection_expression
  body                         = var.apigatewayv2_api_body
  credentials_arn              = var.apigatewayv2_api_credentials_arn 
  description                  = var.apigatewayv2_api_description
  disable_execute_api_endpoint = var.apigatewayv2_api_disable_execute_api_endpoint
  fail_on_warnings             = var.apigatewayv2_api_fail_on_warnings
  name                         = var.apigatewayv2_api_name
  protocol_type                = var.apigatewayv2_api_protocol_type
  route_key                    = var.apigatewayv2_api_route_key
  route_selection_expression   = var.apigatewayv2_api_route_selection_expression
  target                       = var.apigatewayv2_api_target
  version                      = var.apigatewayv2_api_version
  tags                         = var.apigatewayv2_api_tags

  dynamic "cors_configuration" {
    for_each = var.apigatewayv2_api_cors_configuration
      content {
        allow_credentials = cors_configuration.value["allow_credentials"]
        allow_headers     = cors_configuration.value["allow_headers"]
        allow_methods     = cors_configuration.value["allow_methods"]
        allow_origins     = cors_configuration.value["allow_origins"]
        expose_headers    = cors_configuration.value["expose_headers"]
        max_age           = cors_configuration.value["max_age"]
      }
  }
}
