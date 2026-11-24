resource "aws_lambdamicrovms_image" "lambdamicrovms_image" {
  additional_os_capabilities = var.lambdamicrovms_image_additional_os_capabilities
  base_image_arn             = var.lambdamicrovms_image_base_image_arn
  base_image_version         = var.lambdamicrovms_image_base_image_version
  build_role_arn             = var.lambdamicrovms_image_build_role_arn
  description                = var.lambdamicrovms_image_description
  egress_network_connectors  = var.lambdamicrovms_image_egress_network_connectors
  environment_variables      = var.lambdamicrovms_image_environment_variables
  name                       = var.lambdamicrovms_image_name
  tags                       = var.lambdamicrovms_image_tags

  dynamic "code_artifact" {
    for_each = var.lambdamicrovms_image_code_artifact
      content {
        uri = code_artifact.value["uri"]
      }
  }
  dynamic "cpu_configuration" {
    for_each = var.lambdamicrovms_image_cpu_configuration
      content {
        architecture = cpu_configuration.value["architecture"]
      }
  }
}
