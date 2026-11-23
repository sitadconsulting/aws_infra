resource "aws_iot_thing_type" "iot_thing_type" {
  deprecated = var.iot_thing_type_deprecated
  name       = var.iot_thing_type_name
  tags       = var.iot_thing_type_tags

  dynamic "properties" {
    for_each = var.iot_thing_type_properties
      content {
        description           = properties.value["description"]
        searchable_attributes = properties.value["searchable_attributes"]
      }
  }
}
