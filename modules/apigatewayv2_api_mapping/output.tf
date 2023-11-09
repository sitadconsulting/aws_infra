output "aws_apigatewayv2_api_mapping_id" {
  description = "API mapping identifier"
  value       = element(concat(aws_apigatewayv2_api_mapping.apigatewayv2_api_mapping.*.id, [""]), 0)
}
