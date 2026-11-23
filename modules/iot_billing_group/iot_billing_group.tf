resource "aws_iot_billing_group" "iot_billing_group" {
  name = var.iot_billing_group_name
  tags = var.iot_billing_group_tags


  dynamic "properties" {
    for_each = var.iot_billing_group_properties
      content {
        description = properties.value["description"]
      }
  }
}
