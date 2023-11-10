resource "aws_api_gateway_usage_plan" "api_gateway_usage_plan" {
  description  = var.api_gateway_usage_plan_description
  name         = var.api_gateway_usage_plan_name
  product_code = var.api_gateway_usage_plan_product_code
  tags         = var.api_gateway_usage_plan_tags

  dynamic "api_stages" {
    for_each = var.api_gateway_usage_plan_api_stages
      content {
        api_id  = api_stages.value["api_id"]
        stage   = api_stages.value["stage"]
        dynamic "throttle" {
          for_each = api_stages.value.throttle
            content {
              burst_limit = throttle.value["burst_limit"]
              path        = throttle.value["path"]
              rate_limit  = throttle.value["rate_limit"]
            }
        }
      }
  }
  dynamic "quota_settings" {
    for_each = var.api_gateway_usage_plan_quota_settings
      content {
        limit  = quota_settings.value["limit"]
        offset = quota_settings.value["offset"]
        period = quota_settings.value["period"]
      }
  }
  dynamic "throttle_settings" {
    for_each = var.api_gateway_usage_plan_throttle_settings
      content {
        burst_limit = throttle_settings.value["burst_limit"] 
        rate_limit  = throttle_settings.value["rate_limit"]
      }
  }
}
