resource "aws_sagemaker_model_package_group" "sagemaker_model_package_group" {
  model_package_group_name        = var.sagemaker_model_package_group_model_package_group_name
  model_package_group_description = var.sagemaker_model_package_group_model_package_group_description 
  tags                            = var.sagemaker_model_package_group_tags
}
