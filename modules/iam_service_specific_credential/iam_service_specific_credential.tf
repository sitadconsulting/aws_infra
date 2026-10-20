resource "aws_iam_service_specific_credential" "iam_service_specific_credential" {
  credential_age_days = var.iam_service_specific_credential_credential_age_days
  service_name        = var.iam_service_specific_credential_service_name
  status              = var.iam_service_specific_credential_status
  user_name           = var.iam_service_specific_credential_user_name
}
