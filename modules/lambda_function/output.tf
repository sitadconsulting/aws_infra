output "lambda_function_arn" {
  description = "ARN identifying your Lambda Function"
  value       = element(concat(aws_lambda_function.lambda_function.*.arn, [""]), 0)
}
output "lambda_function_invoke_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       = element(concat(aws_lambda_function.lambda_function.*.invoke_arn, [""]), 0)
}
output "lambda_function_last_modified" {
  description = "Date this resource was last modified"
  value       = element(concat(aws_lambda_function.lambda_function.*.last_modified, [""]), 0)
}
output "lambda_function_qualified_arn" {
  description = "ARN identifying your Lambda Function Version (if versioning is enabled via publish = true)"
  value       = element(concat(aws_lambda_function.lambda_function.*.qualified_arn, [""]), 0)
}
output "lambda_function_qualified_invoke_arn" {
  description = "Qualified ARN (ARN with lambda version number) to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       = element(concat(aws_lambda_function.lambda_function.*.qualified_invoke_arn, [""]), 0)
}
output "lambda_function_signing_job_arn" {
  description = "ARN of the signing job"
  value       = element(concat(aws_lambda_function.lambda_function.*.signing_job_arn, [""]), 0)
}
output "lambda_function_signing_profile_version_arn" {
  description = "ARN of the signing profile version"
  value       = element(concat(aws_lambda_function.lambda_function.*.signing_profile_version_arn, [""]), 0)
}
output "lambda_function_snap_start_optimization_status" {
  description = "Optimization status of the snap start configuration. Valid values are On and Off"
  value       = element(concat(aws_lambda_function.lambda_function.*.snap_start.optimization_status, [""]), 0)
}
output "lambda_function_source_code_size" {
  description = "Size in bytes of the function .zip file"
  value       = element(concat(aws_lambda_function.lambda_function.*.source_code_size, [""]), 0)
}
output "lambda_function_version" {
  description = "Latest published version of your Lambda Function"
  value       = element(concat(aws_lambda_function.lambda_function.*.version, [""]), 0)
}
output "lambda_function_vpc_config_vpc_id" {
  description = "ID of the VPC"
  value       = element(concat(aws_lambda_function.lambda_function.*.vpc_config.vpc_id, [""]), 0)
}
