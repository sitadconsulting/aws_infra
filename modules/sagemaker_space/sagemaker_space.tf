resource "aws_sagemaker_space" "sagemaker_space" {
  space_name = var.sagemaker_space_space_name
  domain_id  = var.sagemaker_space_domain_id
  tags       = var.sagemaker_space_tags
  
  dynamic "space_settings" {
    for_each = var.sagemaker_space_space_settings
      content {
        dynamic "jupyter_server_app_settings" {
          for_each = space_settings.value.jupyter_server_app_settings
            content {
              lifecycle_config_arns = jupyter_server_app_settings.value["lifecycle_config_arns"]
              dynamic "code_repository" {
                for_each = jupyter_server_app_settings.value.code_repository
                  content {
                    repository_url = code_repository.value["repository_url"]
                  }
              }
              dynamic "default_resource_spec" {
                for_each = jupyter_server_app_settings.value.default_resource_spec
                  content {
                    instance_type               = default_resource_spec.value["instance_type"]
                    lifecycle_config_arn        = default_resource_spec.value["lifecycle_config_arn"]
                    sagemaker_image_arn         = default_resource_spec.value["sagemaker_image_arn"]
                    sagemaker_image_version_arn = default_resource_spec.value["sagemaker_image_version_arn"] 
                  }
              }
            }
        }
        dynamic "kernel_gateway_app_settings" {
          for_each = space_settings.value.kernel_gateway_app_settings
            content {
              lifecycle_config_arns = kernel_gateway_app_settings.value["lifecycle_config_arns"]
              dynamic "default_resource_spec" {
                for_each = kernel_gateway_app_settings.value.default_resource_spec
                  content {
                    instance_type               = default_resource_spec.value["instance_type"]
                    lifecycle_config_arn        = default_resource_spec.value["lifecycle_config_arn"]
                    sagemaker_image_arn         = default_resource_spec.value["sagemaker_image_arn"]
                    sagemaker_image_version_arn = default_resource_spec.value["sagemaker_image_version_arn"]
                  }
              }
              dynamic "custom_image" {
                for_each = kernel_gateway_app_settings.value.custom_image
                  content {
                    app_image_config_name = custom_image.value["app_image_config_name"]
                    image_name            = custom_image.value["image_name"]
                    image_version_number  = custom_image.value["image_version_number"]
                  }
              }
            }
        }
      }
  }
}
