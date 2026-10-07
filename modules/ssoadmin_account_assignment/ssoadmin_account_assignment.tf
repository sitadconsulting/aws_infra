resource "aws_ssoadmin_account_assignment" "ssoadmin_account_assignment" {
  instance_arn       = var.ssoadmin_account_assignment_instance_arn
  permission_set_arn = var.ssoadmin_account_assignment_permission_set_arn
  principal_id       = var.ssoadmin_account_assignment_principal_id
  principal_type     = var.ssoadmin_account_assignment_principal_type
  target_id          = var.ssoadmin_account_assignment_target_id
  target_type        = var.ssoadmin_account_assignment_target_type
}
