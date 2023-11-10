resource "aws_api_gateway_integration" "api_gateway_integration" {
  cache_key_parameters    = var.api_gateway_integration_cache_key_parameters
  cache_namespace         = var.api_gateway_integration_cache_namespace
  connection_id           = var.api_gateway_integration_connection_id
  connection_type         = var.api_gateway_integration_connection_type
  content_handling        = var.api_gateway_integration_content_handling
  credentials             = var.api_gateway_integration_credentials
  http_method             = var.api_gateway_integration_http_method
  integration_http_method = var.api_gateway_integration_integration_http_method
  passthrough_behavior    = var.api_gateway_integration_passthrough_behavior
  request_parameters      = var.api_gateway_integration_request_parameters
  request_templates       = var.api_gateway_integration_request_templates
  resource_id             = var.api_gateway_integration_resource_id
  rest_api_id             = var.api_gateway_integration_rest_api_id
  timeout_milliseconds    = var.api_gateway_integration_timeout_milliseconds
  type                    = var.api_gateway_integration_type
  uri                     = var.api_gateway_integration_uri
  
  dynamic "tls_config" {
    for_each = var.api_gateway_integration_tls_config
      content {
        insecure_skip_verification = tls_config.value["insecure_skip_verification"]
      }
  }
}
