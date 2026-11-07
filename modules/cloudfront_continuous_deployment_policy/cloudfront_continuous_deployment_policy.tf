resource "aws_cloudfront_continuous_deployment_policy" "cloudfront_continuous_deployment_policy" {
  enabled  = var.cloudfront_continuous_deployment_policy_enabled

  dynamic "staging_distribution_dns_names" {
    for_each = var.cloudfront_continuous_deployment_policy_staging_distribution_dns_names
      content {
        items    = staging_distribution_dns_names.value["items"]
        quantity = staging_distribution_dns_names.value["quantity"]
      }
  }
  dynamic "traffic_config" {
    for_each = var.cloudfront_continuous_deployment_policy_traffic_config
      content {
        type = traffic_config.value["type"]
        dynamic "single_header_config" {
          for_each = traffic_config.value.single_header_config
            content {
              header = single_header_config.value["header"]
              value  = single_header_config.value["value"]
            }
        }
        dynamic "single_weight_config" {
          for_each = traffic_config.value.single_weight_config
            content {
              weight = single_weight_config.value["weight"]
              dynamic "session_stickiness_config" {
                for_each = single_weight_config.value.session_stickiness_config
                  content {
                    idle_ttl    = session_stickiness_config.value["idle_ttl"]
                    maximum_ttl = session_stickiness_config.value["maximum_ttl"] 
                  }
              }
            }
        }
      }
  }
}
