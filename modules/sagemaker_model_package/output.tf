output "sagemaker_model_package_creation_time" {
  description = "The time at which the model package was created"
  value       = element(concat(awscc_sagemaker_model_package.sagemaker_model_package.*.creation_time, [""]), 0)
}
output "sagemaker_model_package_last_modified_time" {
  description = "The time at which the model package was last modified"
  value       = element(concat(awscc_sagemaker_model_package.sagemaker_model_package.*.last_modified_time, [""]), 0)
}
output "sagemaker_model_package_model_approval_status" {
  description = "The approval status of the model package"
  value       = element(concat(awscc_sagemaker_model_package.sagemaker_model_package.*.model_approval_status, [""]), 0)
}
output "sagemaker_model_package_model_package_arn" {
  description = "The Amazon Resource Name (ARN) of the model package group"
  value       = element(concat(awscc_sagemaker_model_package.sagemaker_model_package.*.model_package_arn, [""]), 0)
}
output "sagemaker_model_package_model_package_status" {
  description = "The current status of the model package"
  value       = element(concat(awscc_sagemaker_model_package.sagemaker_model_package.*.model_package_status, [""]), 0)
}
