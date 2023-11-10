output "api_gateway_stage_arn" {
  description = "Stage ARN"
  value       = element(concat(aws_api_gateway_stage.api_gateway_stage.*.arn, [""]), 0)
}
output "api_gateway_stage_id" {
  description = "Stage ID"
  value       = element(concat(aws_api_gateway_stage.api_gateway_stage.*.id, [""]), 0)
}
output "api_gateway_stage_invoke_url" {
  description = "URL to invoke the API pointing to the stage, e.g., https://z4675bid1j.execute-api.eu-west-2.amazonaws.com/prod"
  value       = element(concat(aws_api_gateway_stage.api_gateway_stage.*.invoke_url, [""]), 0)
}
output "api_gateway_stage_execution_arn" {
  description = "Execution ARN to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function, e.g., arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j/prod"
  value       = element(concat(aws_api_gateway_stage.api_gateway_stage.*.execution_arn, [""]), 0)
}
output "api_gateway_stage_web_acl_arn" {
  description = "ARN of the WebAcl associated with the Stage"
  value       = element(concat(aws_api_gateway_stage.api_gateway_stage.*.web_acl_arn, [""]), 0)
}
