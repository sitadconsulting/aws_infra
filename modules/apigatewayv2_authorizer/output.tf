output "apigatewayv2_authorizer_id" {
  description = "Authorizer identifier"
  value       = element(concat(aws_apigatewayv2_authorizer.apigatewayv2_authorizer.*.id, [""]), 0)
}

