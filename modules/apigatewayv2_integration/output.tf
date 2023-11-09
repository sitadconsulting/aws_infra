output "apigatewayv2_integration_id" {
  description = "Integration identifier"
  value       = element(concat(aws_apigatewayv2_integration.apigatewayv2_integration.*.id, [""]), 0)
}
output "apigatewayv2_integration_integration_response_selection_expression" {
  description = "The integration response selection expression for the integration"
  value       = element(concat(aws_apigatewayv2_integration.apigatewayv2_integration.*.integration_response_selection_expression, [""]), 0)
}
