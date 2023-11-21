resource "aws_sagemaker_app" "sagemaker_app" {
  app_name          = var.sagemaker_app_app_name
  app_type          = var.sagemaker_app_app_type
  domain_id         = var.sagemaker_app_domain_id
  space_name        = var.sagemaker_app_space_name
  tags              = var.sagemaker_app_tags
  user_profile_name = var.sagemaker_app_user_profile_name

  dynamic "resource_spec" {
    for_each = var.sagemaker_app_resource_spec
      content {
        instance_type               = resource_spec.value["instance_type"]
        lifecycle_config_arn        = resource_spec.value["lifecycle_config_arn"]
        sagemaker_image_arn         = resource_spec.value["sagemaker_image_arn"]
        sagemaker_image_version_arn = resource_spec.value["sagemaker_image_version_arn"]
      }
  }
}
