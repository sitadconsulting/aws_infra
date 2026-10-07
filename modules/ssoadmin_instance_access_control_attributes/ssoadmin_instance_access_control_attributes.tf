resource "aws_ssoadmin_instance_access_control_attributes" "ssoadmin_instance_access_control_attributes" {
  instance_arn = var.ssoadmin_instance_access_control_attributes_instance_arn

  dynamic "attribute" {
    for_each = var.ssoadmin_instance_access_control_attributes_attribute
      content {
        key = attribute.value["key"]
        dynamic "value" {
          for_each = attribute.value.value
            content {
              source = value.value["source"]
            }
        }
      }
  }
}
