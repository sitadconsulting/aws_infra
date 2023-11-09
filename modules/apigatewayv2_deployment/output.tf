output "apigatewayv2_deployment_id" {
  description = "Deployment identifier"
  value       = element(concat(aws_apigatewayv2_deployment.apigatewayv2_deployment.*.id, [""]), 0)
}
output "apigatewayv2_deployment_auto_deployed" {
  description = "Whether the deployment was automatically released"
  value       = element(concat(aws_apigatewayv2_deployment.apigatewayv2_deployment.*.auto_deployed, [""]), 0)
}
