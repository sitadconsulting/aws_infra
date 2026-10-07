resource "aws_ssoadmin_application_access_scope" "ssoadmin_application_access_scope" {
  application_arn    = var.ssoadmin_application_access_scope_application_arn
  authorized_targets = var.ssoadmin_application_access_scope_authorized_targets
  scope              = var.ssoadmin_application_access_scope_scope
}
