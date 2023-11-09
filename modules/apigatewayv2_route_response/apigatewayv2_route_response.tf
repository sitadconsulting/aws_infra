resource "aws_apigatewayv2_route_response" "apigatewayv2_route_response" {
  api_id                     = var.apigatewayv2_route_response_api_id
  model_selection_expression = var.apigatewayv2_route_response_model_selection_expression 
  response_models            = var.apigatewayv2_route_response_response_models
  route_id                   = var.apigatewayv2_route_response_route_id
  route_response_key         = var.apigatewayv2_route_response_route_response_key
}
