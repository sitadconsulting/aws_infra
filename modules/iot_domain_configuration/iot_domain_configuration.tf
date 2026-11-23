resource "aws_iot_domain_configuration" "iot_domain_configuration" {
  application_protocol         = var.iot_domain_configuration_application_protocol
  authentication_type          = var.iot_domain_configuration_authentication_type
  domain_name                  = var.iot_domain_configuration_domain_name
  name                         = var.iot_domain_configuration_name
  server_certificate_arns      = var.iot_domain_configuration_server_certificate_arns
  service_type                 = var.iot_domain_configuration_service_type
  status                       = var.iot_domain_configuration_status
  tags                         = var.iot_domain_configuration_tags 
  validation_certificate_arn   = var.iot_domain_configuration_validation_certificate_arn


  dynamic "authorizer_config" {
    for_each = var.iot_domain_configuration_authorizer_config
      content {
        allow_authorizer_override = authorizer_config.value["allow_authorizer_override"]
        default_authorizer_name   = authorizer_config.value["default_authorizer_name"]
      }
  }
  dynamic "tls_config" {
    for_each = var.iot_domain_configuration_tls_config
      content {
        security_policy = tls_config.value["security_policy"]
      }
  }
}
