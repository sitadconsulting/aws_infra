output "api_gateway_deployment_id" {
  description = "Deployment ID"
  value       = element(concat(aws_api_gateway_deployment.api_gateway_deployment.*.id, [""]), 0)
}
output "api_gateway_deployment_created_date" {
  description = "Creation date of the deployment"
  value       = element(concat(aws_api_gateway_deployment.api_gateway_deployment.*.created_date, [""]), 0)
}
