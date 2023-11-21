resource "aws_sagemaker_studio_lifecycle_config" "sagemaker_studio_lifecycle_config" {
  studio_lifecycle_config_app_type = var.sagemaker_studio_lifecycle_config_studio_lifecycle_config_app_type
  studio_lifecycle_config_content  = var.sagemaker_studio_lifecycle_config_studio_lifecycle_config_content
  studio_lifecycle_config_name     = var.sagemaker_studio_lifecycle_config_studio_lifecycle_config_name
  tags                             = var.sagemaker_studio_lifecycle_config_tags
}
