resource "aws_acmpca_certificate" "acmpca_certificate" {
  api_passthrough             = var.acmpca_certificate_api_passthrough
  certificate_authority_arn   = var.acmpca_certificate_certificate_authority_arn
  certificate_signing_request = var.acmpca_certificate_certificate_signing_request
  signing_algorithm           = var.acmpca_certificate_signing_algorithm
  template_arn                = var.acmpca_certificate_template_arn

  dynamic "validity" {
    for_each = var.acmpca_certificate_validity
      content {
        type  = validity.value["type"]
        value = validity.value["value"]
      }
  }
}
