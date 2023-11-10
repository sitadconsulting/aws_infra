resource "aws_api_gateway_gateway_response" "api_gateway_gateway_response" {
  response_parameters = var.api_gateway_gateway_response_response_parameters
  response_templates  = var.api_gateway_gateway_response_response_templates
  response_type       = var.api_gateway_gateway_response_response_type
  rest_api_id         = var.api_gateway_gateway_response_rest_api_id
  status_code         = var.api_gateway_gateway_response_status_code
}
