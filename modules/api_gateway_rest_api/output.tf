output "api_gateway_rest_api_arn" {
  description = "REST API ARN"
  value       = element(concat(aws_api_gateway_rest_api.api_gateway_rest_api.*.arn, [""]), 0)
}
output "api_gateway_rest_api_created_date" {
  description = "Creation date of the REST API"
  value       = element(concat(aws_api_gateway_rest_api.api_gateway_rest_api.*.created_date, [""]), 0)
}
output "api_gateway_rest_api_execution_arn" {
  description = "Execution ARN part to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function, e.g., arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j, which can be concatenated with allowed stage, method and resource path"
  value       = element(concat(aws_api_gateway_rest_api.api_gateway_rest_api.*.execution_arn, [""]), 0)
}
output "api_gateway_rest_api_id" {
  description = "REST API ID"
  value       = element(concat(aws_api_gateway_rest_api.api_gateway_rest_api.*.id, [""]), 0)
}
output "api_gateway_rest_api_root_resource_id" {
  description = "Resource ID of the REST API's root"
  value       = element(concat(aws_api_gateway_rest_api.api_gateway_rest_api.*.root_resource_id, [""]), 0)
}
