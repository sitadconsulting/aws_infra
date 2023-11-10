resource "aws_api_gateway_method" "api_gateway_method" {
  api_key_required     = var.api_gateway_method_api_key_required
  authorization        = var.api_gateway_method_authorization
  authorization_scopes = var.api_gateway_method_authorization_scopes
  authorizer_id        = var.api_gateway_method_authorizer_id
  http_method          = var.api_gateway_method_http_method
  operation_name       = var.api_gateway_method_operation_name
  request_models       = var.api_gateway_method_request_models
  request_parameters   = var.api_gateway_method_request_parameters
  request_validator_id = var.api_gateway_method_request_validator_id
  resource_id          = var.api_gateway_method_resource_id
  rest_api_id          = var.api_gateway_method_rest_api_id
}
