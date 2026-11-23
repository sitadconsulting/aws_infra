resource "aws_iot_ca_certificate" "iot_ca_certificate" {
  active                       = var.iot_ca_certificate_active
  allow_auto_registration      = var.iot_ca_certificate_allow_auto_registration
  ca_certificate_pem           = var.iot_ca_certificate_ca_certificate_pem
  certificate_mode             = var.iot_ca_certificate_certificate_mode
  tags                         = var.iot_ca_certificate_tags
  verification_certificate_pem = var.iot_ca_certificate_verification_certificate_pem 

  dynamic "registration_config" {
    for_each = var.iot_ca_certificate_registration_config
      content {
        role_arn      = registration_config.value["role_arn"]
        template_body = registration_config.value["template_body"]
        template_name = registration_config.value["template_name"]
      }
  }
}
