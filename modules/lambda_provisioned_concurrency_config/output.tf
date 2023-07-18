output "lambda_provisioned_concurrency_config_id" {
  description = "Lambda Function name and qualifier separated by a comma (,)"
  value       = element(concat(aws_lambda_provisioned_concurrency_config.lambda_provisioned_concurrency_config.*.id, [""]), 0)
}
