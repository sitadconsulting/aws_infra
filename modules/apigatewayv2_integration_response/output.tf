output "apigatewayv2_integration_response_id" {
  description = "Integration response identifier"
  value       = element(concat(aws_apigatewayv2_integration_response.apigatewayv2_integration_response.*.id, [""]), 0)
}

