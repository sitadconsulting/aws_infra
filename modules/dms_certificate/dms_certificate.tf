resource "aws_dms_certificate" "dms_certificate" {
  certificate_id     = var.dms_certificate_certificate_id
  certificate_pem    = var.dms_certificate_certificate_pem
  certificate_wallet = var.dms_certificate_certificate_wallet
  tags               = var.dms_certificate_tags
}
