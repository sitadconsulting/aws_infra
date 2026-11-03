resource "aws_cloudwatchomni_domain" "cloudwatchomni_domain" {
  identity_providers = var.cloudwatchomni_domain_identity_providers
  name               = var.cloudwatchomni_domain_name
  
  dynamic "identity_provider_configuration" {
    for_each = var.cloudwatchomni_domain_identity_provider_configuration
      content {
        dynamic "identity_center_configuration" {
          for_each = identity_provider_configuration.value.identity_center_configuration
            content {
              identity_center_instance_arn = identity_center_configuration.value["identity_center_instance_arn"]
            }
        }
      }
  }
}
