resource "aws_apigatewayv2_api_mapping" "apigatewayv2_api_mapping" {
  api_id          = var.apigatewayv2_api_mapping_api_id
  api_mapping_key = var.apigatewayv2_api_mapping_api_mapping_key
  domain_name     = var.apigatewayv2_api_mapping_domain_name
  stage           = var.apigatewayv2_api_mapping_stage
}
