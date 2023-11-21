output "sagemaker_app_image_config_id" {
  description = "The name of the App Image Config"
  value       = element(concat(aws_sagemaker_app_image_config.sagemaker_app_image_config.*.id, [""]), 0)
}
output "sagemaker_app_image_config_arn" {
  description = "ARN assigned by AWS to this App Image Config"
  value       = element(concat(aws_sagemaker_app_image_config.sagemaker_app_image_config.*.arn, [""]), 0)
}
