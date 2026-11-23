resource "aws_iot_thing_group_membership" "iot_thing_group_membership" {
  thing_name             = var.iot_thing_group_membership_thing_name
  thing_group_name       = var.iot_thing_group_membership_thing_group_name
  override_dynamic_group = var.iot_thing_group_membership_override_dynamic_group
}
