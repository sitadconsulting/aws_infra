output "sagemaker_model_package_group_policy_id" {
  description = "The name of the Model Package Package Group"
  value       = element(concat(aws_sagemaker_model_package_group_policy.sagemaker_model_package_group_policy.*.id, [""]), 0)
}
