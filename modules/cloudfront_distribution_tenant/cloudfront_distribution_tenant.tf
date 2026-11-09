resource "aws_cloudfront_distribution_tenant" "cloudfront_distribution_tenant" {
  connection_group_id = var.cloudfront_distribution_tenant_connection_group_id
  distribution_id     = var.cloudfront_distribution_tenant_distribution_id
  domain              = var.cloudfront_distribution_tenant_domain
  enabled             = var.cloudfront_distribution_tenant_enabled
  name                = var.cloudfront_distribution_tenant_name
  wait_for_deployment = var,cloudfront_distribution_tenant_wait_for_deployment
  tags                = var.cloudfront_distribution_tenant_tags
  

  dynamic "customizations" {
    for_each = var.cloudfront_distribution_tenant_customizations
      content {
        dynamic "certificate" {
          for_each = customizations.value.certificate
            content {
              arn = certificate.value["arn"]
            }
        }
        dynamic "geo_restriction" {
          for_each = customizations.value.geo_restriction
            content {
              restriction_type = geo_restriction.value["restriction_type"]
              locations        = geo_restriction.value["locations"]
            }
        }
        dynamic "web_acl" {
          for_each = customizations.value.web_acl
            content {
              action = web_acl.value["action"]
              arn    = web_acl.value["arn"]
            }
        }
      }
  }
  dynamic "managed_certificate_request" {
    for_each = var.cloudfront_distribution_tenant_managed_certificate_request
      content {
        certificate_transparency_logging_preference = managed_certificate_request.value["certificate_transparency_logging_preference"]
        primary_domain_name                         = managed_certificate_request.value["primary_domain_name"]
        validation_token_host                       = managed_certificate_request.value["validation_token_host"]
      }
  }
  dynamic "parameter" {
    for_each = var.cloudfront_distribution_tenant_parameter
      content {
        name  = parameter.value["name"]
        value = parameter.value["value"]
      }
  }
}
