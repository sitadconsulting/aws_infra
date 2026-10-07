resource "aws_ssoadmin_permission_set" "ssoadmin_permission_set" {
  description      = var.ssoadmin_permission_set_description
  instance_arn     = var.ssoadmin_permission_set_instance_arn
  name             = var.ssoadmin_permission_set_name
  relay_state      = var.ssoadmin_permission_set_relay_state
  session_duration = var.ssoadmin_permission_set_session_duration
  tags             = var.ssoadmin_permission_set_tags
}
