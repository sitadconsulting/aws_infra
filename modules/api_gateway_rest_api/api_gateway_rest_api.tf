resource "aws_api_gateway_rest_api" "api_gateway_rest_api" {
  api_key_source               = var.api_gateway_rest_api_api_key_source
  binary_media_types           = var.api_gateway_rest_api_binary_media_types
  body                         = var.api_gateway_rest_api_body
  description                  = var.api_gateway_rest_api_description
  disable_execute_api_endpoint = var.api_gateway_rest_api_disable_execute_api_endpoint 
  fail_on_warnings             = var.api_gateway_rest_api_fail_on_warnings
  minimum_compression_size     = var.api_gateway_rest_api_minimum_compression_size
  name                         = var.api_gateway_rest_api_name
  parameters                   = var.api_gateway_rest_api_parameters
  policy                       = var.api_gateway_rest_api_policy
  put_rest_api_mode            = var.api_gateway_rest_api_put_rest_api_mode
  tags                         = var.api_gateway_rest_api_tags

  dynamic "endpoint_configuration" {
    for_each = var.api_gateway_rest_api_endpoint_configuration
      content {
        types            = endpoint_configuration.value["types"]
        vpc_endpoint_ids = endpoint_configuration.value["vpc_endpoint_ids"]
      }
  }
}
