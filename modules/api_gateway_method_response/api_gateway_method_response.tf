resource "aws_api_gateway_method_response" "api_gateway_method_response" {
  http_method         = var.api_gateway_method_response_http_method
  resource_id         = var.api_gateway_method_response_resource_id
  response_models     = var.api_gateway_method_response_response_models
  response_parameters = var.api_gateway_method_response_response_parameters
  rest_api_id         = var.api_gateway_method_response_rest_api_id
  status_code         = var.api_gateway_method_response_status_code
}
