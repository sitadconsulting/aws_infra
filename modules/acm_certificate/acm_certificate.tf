resource "aws_acm_certificate" "acm_certificate" {
  domain_name               = var.acm_certificate_domain_name
  subject_alternative_names = var.acm_certificate_subject_alternative_names
  validation_method         = var.acm_certificate_validation_method
  key_algorithm             = var.acm_certificate_key_algorithm
  private_key               = var.acm_certificate_private_key
  certificate_body          = var.acm_certificate_certificate_body
  certificate_chain         = var.acm_certificate_certificate_chain
  certificate_authority_arn = var.acm_certificate_certificate_authority_arn
  early_renewal_duration    = var.acm_certificate_early_renewal_duration
  tags                      = var.acm_certificate_tags

  dynamic "options" {
    for_each = var.acm_certificate_options
      content {
        certificate_transparency_logging_preference = options.value["certificate_transparency_logging_preference"]
      }
  } 
  dynamic "validation_option" {
    for_each = var.acm_certificate_validation_option
      content {
        domain_name       = validation_option.value["domain_name"]
        validation_domain = validation_option.value["validation_domain"]
      }
  }
  lifecycle {
    create_before_destroy = true
  }
}
