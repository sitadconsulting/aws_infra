resource "aws_iam_signing_certificate" "iam_signing_certificate" {
  certificate_body = var.iam_signing_certificate_certificate_body
  status           = var.iam_signing_certificate_status
  user_name        = var.iam_signing_certificate_user_name
}
