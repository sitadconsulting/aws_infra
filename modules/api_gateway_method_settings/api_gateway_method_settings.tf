resource "aws_api_gateway_method_settings" "api_gateway_method_settings" {
  rest_api_id = var.api_gateway_method_settings_rest_api_id
  stage_name  = var.api_gateway_method_settings_stage_name
  method_path = var.api_gateway_method_settings_method_path
  

  dynamic "settings" {
    for_each = var.api_gateway_method_settings_settings
      content {
        metrics_enabled                            = settings.value["metrics_enabled"]
        logging_level                              = settings.value["logging_level"]
        data_trace_enabled                         = settings.value["data_trace_enabled"]
        throttling_burst_limit                     = settings.value["throttling_burst_limit"]
        throttling_rate_limit                      = settings.value["throttling_rate_limit"]
        caching_enabled                            = settings.value["caching_enabled"]
        cache_ttl_in_seconds                       = settings.value["cache_ttl_in_seconds"]
        cache_data_encrypted                       = settings.value["cache_data_encrypted"]
        require_authorization_for_cache_control    = settings.value["require_authorization_for_cache_control"]  
        unauthorized_cache_control_header_strategy = settings.value["unauthorized_cache_control_header_strategy"]
      }
  }
}
