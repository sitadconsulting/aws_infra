output "sagemaker_model_package_group_arn" {
  description = "ARN assigned by AWS to this Model Package Group"
  value       = element(concat(aws_sagemaker_model_package_group.sagemaker_model_package_group.*.arn, [""]), 0)
}
output "sagemaker_model_package_group_id" {
  description = "The name of the Model Package Group"
  value       = element(concat(aws_sagemaker_model_package_group.sagemaker_model_package_group.*.id, [""]), 0)
}
