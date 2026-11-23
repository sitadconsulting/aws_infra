resource "aws_iot_thing" "iot_thing" {
  attributes      = var.iot_thing_attributes
  name            = var.iot_thing_name
  thing_type_name = var.iot_thing_thing_type_name
}
