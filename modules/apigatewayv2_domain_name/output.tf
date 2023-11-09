output "apigatewayv2_domain_name_api_mapping_selection_expression" {
  description = "API mapping selection expression for the domain name"
  value       = element(concat(aws_apigatewayv2_domain_name.apigatewayv2_domain_name.*.api_mapping_selection_expression, [""]), 0)
}
output "apigatewayv2_domain_name_arn" {
  description = "Domain name ARN"
  value       = element(concat(aws_apigatewayv2_domain_name.apigatewayv2_domain_name.*.arn, [""]), 0)
}
output "apigatewayv2_domain_name_id" {
  description = "Domain name identifier"
  value       = element(concat(aws_apigatewayv2_domain_name.apigatewayv2_domain_name.*.id, [""]), 0)
}
