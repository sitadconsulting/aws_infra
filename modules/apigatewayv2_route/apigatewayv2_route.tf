resource "aws_apigatewayv2_route" "apigatewayv2_route" {
  api_id                              = var.apigatewayv2_route_api_id
  api_key_required                    = var.apigatewayv2_route_api_key_required
  authorization_scopes                = var.apigatewayv2_route_authorization_scopes
  authorization_type                  = var.apigatewayv2_route_authorization_type
  authorizer_id                       = var.apigatewayv2_route_authorizer_id
  model_selection_expression          = var.apigatewayv2_route_model_selection_expression
  operation_name                      = var.apigatewayv2_route_operation_name 
  request_models                      = var.apigatewayv2_route_request_models
  route_key                           = var.apigatewayv2_route_route_key
  route_response_selection_expression = var.apigatewayv2_route_route_response_selection_expression
  target                              = var.apigatewayv2_route_target


  dynamic "request_parameter" {
    for_each = var.apigatewayv2_route_request_parameter
      content {
        request_parameter_key = request_parameter.value["request_parameter_key"] 
        required              = request_parameter.value["required"]
      }
  }
}
