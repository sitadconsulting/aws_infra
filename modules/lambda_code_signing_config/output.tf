output "lambda_code_signing_config_arn" {
  description = "ARN of the code signing configuration"
  value       = element(concat(aws_lambda_code_signing_config.lambda_code_signing_config.*.arn, [""]), 0)
}
output "lambda_code_signing_config_config_id" {
  description = "Unique identifier for the code signing configuration"
  value       = element(concat(aws_lambda_code_signing_config.lambda_code_signing_config.*.config_id, [""]), 0)
}
output "lambda_code_signing_config_last_modified" {
  description = "The date and time that the code signing configuration was last modified"
  value       = element(concat(aws_lambda_code_signing_config.lambda_code_signing_config.*.last_modified, [""]), 0)
}
