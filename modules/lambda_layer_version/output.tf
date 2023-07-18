output "lambda_layer_version_arn" {
  description = "ARN of the Lambda Layer with version"
  value       = element(concat(aws_lambda_layer_version.lambda_layer_version.*.arn, [""]), 0)
}
output "lambda_layer_version_created_date" {
  description = "Date this resource was created"
  value       = element(concat(aws_lambda_layer_version.lambda_layer_version.*.created_date, [""]), 0)
}
output "lambda_layer_version_layer_arn" {
  description = "ARN of the Lambda Layer without version"
  value       = element(concat(aws_lambda_layer_version.lambda_layer_version.*.layer_arn, [""]), 0)
}
output "lambda_layer_version_signing_job_arn" {
  description = "ARN of a signing job"
  value       = element(concat(aws_lambda_layer_version.lambda_layer_version.*.signing_job_arn, [""]), 0)
}
output "lambda_layer_version_signing_profile_version_arn" {
  description = "ARN for a signing profile version"
  value       = element(concat(aws_lambda_layer_version.lambda_layer_version.*.signing_profile_version_arn, [""]), 0)
}
output "lambda_layer_version_source_code_size" {
  description = "Size in bytes of the function .zip file"
  value       = element(concat(aws_lambda_layer_version.lambda_layer_version.*.source_code_size, [""]), 0)
}
output "lambda_layer_version_version" {
  description = "Lambda Layer version"
  value       = element(concat(aws_lambda_layer_version.lambda_layer_version.*.version, [""]), 0)
}
