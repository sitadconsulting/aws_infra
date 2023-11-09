output "apigatewayv2_model_id" {
  description = "Model identifier"
  value       = element(concat(aws_apigatewayv2_model.apigatewayv2_model.*.id, [""]), 0)
}

