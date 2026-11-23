resource "aws_iot_thing_group" "iot_thing_group" {
  name              = var.iot_thing_group_name
  parent_group_name = var.iot_thing_group_parent_group_name
  tags              = var.iot_thing_group_tags

  dynamic "properties" {
    for_each = var.iot_thing_group_properties
      content {
        description = properties.value["description"]
        dynamic "attribute_payload" {
          for_each = properties.value.attribute_payload
            content {
              attributes = attribute_payload.value["attributes"]
            }
        }
      }
  } 
}
