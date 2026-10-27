resource "aws_api_gateway_domain_name" "api_gateway_domain_name" {
  certificate_arn                        = var.api_gateway_domain_name_certificate_arn
  certificate_body                       = var.api_gateway_domain_name_certificate_body
  certificate_chain                      = var.api_gateway_domain_name_certificate_chain
  certificate_name                       = var.api_gateway_domain_name_certificate_name
  certificate_private_key                = var.api_gateway_domain_name_certificate_private_key
  domain_name                            = var.api_gateway_domain_name_domain_name
  endpoint_access_mode                   = var.api_gateway_domain_name_endpoint_access_mode
  ownership_verification_certificate_arn = var.api_gateway_domain_name_ownership_verification_certificate_arn
  policy                                 = var.api_gateway_domain_name_policy
  regional_certificate_arn               = var.api_gateway_domain_name_regional_certificate_arn
  regional_certificate_name              = var.api_gateway_domain_name_regional_certificate_name
  routing_mode                           = var.api_gateway_domain_name_routing_mode
  security_policy                        = var.api_gateway_domain_name_security_policy
  tags                                   = var.api_gateway_domain_name_tags

  dynamic "endpoint_configuration" {
    for_each = var.api_gateway_domain_name_endpoint_configuration
      content {
        ip_address_type = endpoint_configuration.value["ip_address_type"]
        types           = endpoint_configuration.value["types"]
      }
  }  
  dynamic "mutual_tls_authentication" {
    for_each = var.api_gateway_domain_name_mutual_tls_authentication
      content {
        truststore_uri     = mutual_tls_authentication.value["truststore_uri"]
        truststore_version = mutual_tls_authentication.value["truststore_version"]
      }
  }
}
