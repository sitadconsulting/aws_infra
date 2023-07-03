resource "aws_acmpca_certificate_authority_certificate" "certificate_authority_certificate" {
  certificate               = var.certificate_authority_certificate_certificate
  certificate_authority_arn = var.certificate_authority_certificate_certificate_authority_arn
  certificate_chain         = var.certificate_authority_certificate_certificate_chain
}
