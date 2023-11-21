resource "aws_sagemaker_app_image_config" "sagemaker_app_image_config" {
  app_image_config_name = var.sagemaker_app_image_config_app_image_config_name
  tags                  = var.sagemaker_app_image_config_tags

  dynamic "kernel_gateway_image_config" {
    for_each = var.sagemaker_app_image_config_kernel_gateway_image_config
      content {
        dynamic "file_system_config" {
          for_each = kernel_gateway_image_config.value.file_system_config
            content {
              default_gid = file_system_config.value["default_gid"]
              default_uid = file_system_config.value["default_uid"]
              mount_path  = file_system_config.value["mount_path"]
            }
        }
        dynamic "kernel_spec" {
          for_each = kernel_gateway_image_config.value.kernel_spec
            content {
              display_name = kernel_spec.value["display_name"]
              name         = kernel_spec.value["name"]
            }
        }
      }
  }
}
