output "api_gateway_authorizer_arn" {
  description = "API Gateway Authorizer ARN"
  value       = element(concat(aws_api_gateway_authorizer.api_gateway_authorizer.*.arn, [""]), 0)
}
output "api_gateway_authorizer_id" {
  description = "Authorizer identifier"
  value       = element(concat(aws_api_gateway_authorizer.api_gateway_authorizer.*.id, [""]), 0)
}
