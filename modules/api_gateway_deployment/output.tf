output "api_gateway_deployment_id" {
  description = "Deployment ID"
  value       = element(concat(aws_api_gateway_deployment.api_gateway_deployment.*.id, [""]), 0)
}
output "api_gateway_deployment_invoke_url" {
  description = "URL to invoke the API pointing to the stage, e.g., https://z4675bid1j.execute-api.eu-west-2.amazonaws.com/prod"
  value       = element(concat(aws_api_gateway_deployment.api_gateway_deployment.*.invoke_url, [""]), 0)
}
output "api_gateway_deployment_execution_arn" {
  description = "Execution ARN to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function, e.g., arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j/prod"
  value       = element(concat(aws_api_gateway_deployment.api_gateway_deployment.*.execution_arn, [""]), 0)
}
output "api_gateway_deployment_created_date" {
  description = "Creation date of the deployment"
  value       = element(concat(aws_api_gateway_deployment.api_gateway_deployment.*.created_date, [""]), 0)
}
