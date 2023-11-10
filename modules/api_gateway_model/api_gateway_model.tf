resource "aws_api_gateway_model" "api_gateway_model" {
  content_type = var.api_gateway_model_content_type
  description  = var.api_gateway_model_description
  name         = var.api_gateway_model_name
  rest_api_id  = var.api_gateway_model_rest_api_id
  schema       = var.api_gateway_model_schema
}
