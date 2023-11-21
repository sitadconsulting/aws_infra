resource "aws_sagemaker_model_package_group_policy" "sagemaker_model_package_group_policy" {
  model_package_group_name = var.sagemaker_model_package_group_policy_model_package_group_name
  resource_policy          = var.sagemaker_model_package_group_policy_resource_policy
}
