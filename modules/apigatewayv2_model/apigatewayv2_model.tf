resource "aws_apigatewayv2_model" "apigatewayv2_model" {
  api_id       = var.apigatewayv2_model_api_id
  content_type = var.apigatewayv2_model_content_type
  description  = var.apigatewayv2_model_description
  name         = var.apigatewayv2_model_name
  schema       = var.apigatewayv2_model_schema
}
