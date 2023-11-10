resource "aws_api_gateway_integration_response" "api_gateway_integration_response" {
  content_handling    = var.api_gateway_integration_response_content_handling
  http_method         = var.api_gateway_integration_response_http_method
  resource_id         = var.api_gateway_integration_response_resource_id
  response_parameters = var.api_gateway_integration_response_response_parameters
  response_templates  = var.api_gateway_integration_response_response_templates
  rest_api_id         = var.api_gateway_integration_response_rest_api_id
  selection_pattern   = var.api_gateway_integration_response_selection_pattern
  status_code         = var.api_gateway_integration_response_status_code
}
