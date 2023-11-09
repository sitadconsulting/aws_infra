resource "aws_apigatewayv2_domain_name" "apigatewayv2_domain_name" {
  domain_name = var.apigatewayv2_domain_name_domain_name
  tags        = var.apigatewayv2_domain_name_tags

  dynamic "domain_name_configuration" {
    for_each = var.apigatewayv2_domain_name_domain_name_configuration
      content {
        certificate_arn                        = domain_name_configuration.value["certificate_arn"]
        endpoint_type                          = domain_name_configuration.value["endpoint_type"]
        ownership_verification_certificate_arn = domain_name_configuration.value["ownership_verification_certificate_arn"]
        security_policy                        = domain_name_configuration.value["security_policy"]
      }
  }
  dynamic "mutual_tls_authentication" {
    for_each = var.apigatewayv2_domain_name_mutual_tls_authentication
      content {
        truststore_uri     = mutual_tls_authentication.value["truststore_uri"]
        truststore_version = mutual_tls_authentication.value["truststore_version"]
      }
  }
}
