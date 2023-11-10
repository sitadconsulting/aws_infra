resource "aws_api_gateway_api_key" "api_gateway_api_key" {
  customer_id = var.api_gateway_api_key_customer_id
  description = var.api_gateway_api_key_description
  enabled     - var.api_gateway_api_key_enabled
  name        = var.api_gateway_api_key_name
  tags        = var.api_gateway_api_key_tags
  value       = var.api_gateway_api_key_value
}
