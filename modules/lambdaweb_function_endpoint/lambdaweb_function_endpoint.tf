resource "aws_lambdaweb_function_endpoint" "lambdaweb_function_endpoint" {
  auto_deployment_mode = var.lambdaweb_function_endpoint_auto_deployment_mode
  auth_type            = var.lambdaweb_function_endpoint_auth_type
  description          = var.lambdaweb_function_endpoint_description
  endpoint_name        = var.lambdaweb_function_endpoint_endpoint_name
  endpoint_type        = var.lambdaweb_function_endpoint_endpoint_type
  function_name        = var.lambdaweb_function_endpoint_function_name
  regions              = var.lambdaweb_function_endpoint_regions 
  
  dynamic "revision_weight" {
    for_each = var.lambdaweb_function_endpoint_revision_weight
      content {
        revision_id = revision_weight.value["revision_id"]
        weight      = revision_weight.value["weight"]
      }
  }
  dynamic "scaling_config" {
    for_each = var.lambdaweb_function_endpoint_scaling_config
      content {
        max_environments = scaling_config.value["max_environments"]
      }
  }
  dynamic "throttle_config" {
    for_each = var.lambdaweb_function_endpoint_throttle_config
      content {
        rate_limit = throttle_config.value["rate_limit"]
      }
  }
}
