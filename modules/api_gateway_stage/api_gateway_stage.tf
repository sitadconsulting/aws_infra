resource "aws_api_gateway_stage" "api_gateway_stage" {
  cache_cluster_enabled = var.api_gateway_stage_cache_cluster_enabled
  cache_cluster_size    = var.api_gateway_stage_cache_cluster_size
  client_certificate_id = var.api_gateway_stage_client_certificate_id
  deployment_id         = var.api_gateway_stage_deployment_id
  description           = var.api_gateway_stage_description
  documentation_version = var.api_gateway_stage_documentation_version
  rest_api_id           = var.api_gateway_stage_rest_api_id
  stage_name            = var.api_gateway_stage_stage_name
  variables             = var.api_gateway_stage_variables
  tags                  = var.api_gateway_stage_tags
  xray_tracing_enabled  = var.api_gateway_stage_xray_tracing_enabled
   
  dynamic "access_log_settings" {
    for_each = var.api_gateway_stage_access_log_settings
      content {
        destination_arn = access_log_settings.value["destination_arn"]
        format          = access_log_settings.value["format"]
      }
  }
  dynamic "canary_settings" {
    for_each = var.api_gateway_stage_canary_settings
      content {
        percent_traffic          = canary_settings.value["percent_traffic"]
        stage_variable_overrides = canary_settings.value["stage_variable_overrides"]
        use_stage_cache          = canary_settings.value["use_stage_cache"]
      }
  }
}
