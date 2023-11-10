resource "aws_api_gateway_request_validator" "api_gateway_request_validator" {
  name                        = var.api_gateway_request_validator_name
  rest_api_id                 = var.api_gateway_request_validator_rest_api_id
  validate_request_body       = var.api_gateway_request_validator_validate_request_body
  validate_request_parameters = var.api_gateway_request_validator_validate_request_parameters 
}
