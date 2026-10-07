resource "aws_ssoadmin_managed_policy_attachment" "ssoadmin_managed_policy_attachment" {
  instance_arn       = var.ssoadmin_managed_policy_attachment_instance_arn
  permission_set_arn = var.ssoadmin_managed_policy_attachment_permission_set_arn
  managed_policy_arn = var.ssoadmin_managed_policy_attachment_managed_policy_arn
}
