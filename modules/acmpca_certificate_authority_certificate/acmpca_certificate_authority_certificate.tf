resource "aws_acmpca_certificate_authority_certificate" "acmpca_certificate_authority_certificate" {
  certificate               = var.acmpca_certificate_authority_certificate_certificate
  certificate_authority_arn = var.acmpca_certificate_authority_certificate_certificate_authority_arn
  certificate_chain         = var.acmpca_certificate_authority_certificate_certificate_chain
}
