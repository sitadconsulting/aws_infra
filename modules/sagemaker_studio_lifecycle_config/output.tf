output "sagemaker_studio_lifecycle_config_arn" {
  description = "ARN assigned by AWS to this Studio Lifecycle Config"
  value       = element(concat(aws_sagemaker_studio_lifecycle_config.sagemaker_studio_lifecycle_config.*.arn, [""]), 0)
}
output "sagemaker_studio_lifecycle_config_id" {
  description = "The name of the Studio Lifecycle Config"
  value       = element(concat(aws_sagemaker_studio_lifecycle_config.sagemaker_studio_lifecycle_config.*.id, [""]), 0)
}
