resource "aws_ssoadmin_permission_set_inline_policy" "ssoadmin_permission_set_inline_policy" {
  inline_policy      = var.ssoadmin_permission_set_inline_policy_inline_policy
  instance_arn       = var.ssoadmin_permission_set_inline_policy_instance_arnt
  permission_set_arn = var.ssoadmin_permission_set_inline_policy_permission_set_arn
}
