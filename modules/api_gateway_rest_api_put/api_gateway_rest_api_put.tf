resource "aws_api_gateway_rest_api_put" "api_gateway_rest_api_put" {
  body             = var.api_gateway_rest_api_put_body
  fail_on_warnings = var.api_gateway_rest_api_put_fail_on_warnings
  parameters       = var.api_gateway_rest_api_put_parameters
  rest_api_id      = var.api_gateway_rest_api_put_rest_api_id
  triggers         = var.api_gateway_rest_api_put_triggers
}
