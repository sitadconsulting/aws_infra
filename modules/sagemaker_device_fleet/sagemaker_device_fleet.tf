resource "aws_sagemaker_device_fleet" "sagemaker_device_fleet" {
  description           = var.sagemaker_device_fleet_description
  device_fleet_name     = var.sagemaker_device_fleet_device_fleet_name
  enable_iot_role_alias = var.sagemaker_device_fleet_enable_iot_role_alias
  role_arn              = var.sagemaker_device_fleet_role_arn
  tags                  = var.sagemaker_device_fleet_tags

  dynamic "output_config" {
    for_each = var.sagemaker_device_fleet_output_config
      content {
        kms_key_id         = output_config.value["kms_key_id"]
        s3_output_location = output_config.value["s3_output_location"]
      }
  }
}
