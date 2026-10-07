resource "aws_ssoadmin_managed_policy_attachments_exclusive" "ssoadmin_managed_policy_attachments_exclusive" {
  instance_arn        = var.ssoadmin_managed_policy_attachments_exclusive_instance_arn
  managed_policy_arns = var.ssoadmin_managed_policy_attachments_exclusive_managed_policy_arns
  permission_set_arn  = var.ssoadmin_managed_policy_attachments_exclusive_permission_set_arn
}
