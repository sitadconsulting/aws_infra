resource "aws_acm_certificate_validation" "acm_certificate_validation" {
  certificate_arn         = var.acm_certificate_validation_certificate_arn
  validation_record_fqdns = var.acm_certificate_validation_validation_record_fqdns
}
