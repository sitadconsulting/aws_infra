resource "aws_iot_provisioning_template" "iot_provisioning_template" {
  description           = var.iot_provisioning_template_description
  enabled               = var.iot_provisioning_template_enabled
  name                  = var.iot_provisioning_template_name
  provisioning_role_arn = var.iot_provisioning_template_provisioning_role_arn
  tags                  = var.iot_provisioning_template_tags
  template_body         = var.iot_provisioning_template_template_body
  type                  = var.iot_provisioning_template_type


  dynamic "pre_provisioning_hook" {
    for_each = var.iot_provisioning_template_pre_provisioning_hook
      content {
        payload_version = pre_provisioning_hook.value["payload_version"]
        target_arn      = pre_provisioning_hook.value["target_arn"]
      }
  }
}
