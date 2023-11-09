resource "aws_apigatewayv2_integration_response" "apigatewayv2_integration_response" {
  api_id                        = var.apigatewayv2_integration_response_api_id
  content_handling_strategy     = var.apigatewayv2_integration_response_content_handling_strategy
  integration_id                = var.apigatewayv2_integration_response_integration_id
  integration_response_key      = var.apigatewayv2_integration_response_integration_response_key
  response_template             = var.apigatewayv2_integration_response_response_template
  template_selection_expression = var.apigatewayv2_integration_response_template_selection_expression
}
