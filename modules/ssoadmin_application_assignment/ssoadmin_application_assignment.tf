resource "aws_ssoadmin_application_assignment" "ssoadmin_application_assignment" {
  application_arn = var.ssoadmin_application_assignment_application_arn
  principal_id    = var.ssoadmin_application_assignment_principal_id
  principal_type  = var.ssoadmin_application_assignment_principal_type
}
