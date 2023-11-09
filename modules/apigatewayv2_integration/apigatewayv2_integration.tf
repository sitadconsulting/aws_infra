resource "aws_apigatewayv2_integration" "apigatewayv2_integration" {
  api_id                        = var.apigatewayv2_integration_api_id
  connection_id                 = var.apigatewayv2_integration_connection_id
  connection_type               = var.apigatewayv2_integration_connection_type
  content_handling_strategy     = var.apigatewayv2_integration_content_handling_strategy
  credentials_arn               = var.apigatewayv2_integration_credentials_arn
  description                   = var.apigatewayv2_integration_description
  integration_method            = var.apigatewayv2_integration_integration_method
  integration_subtype           = var.apigatewayv2_integration_integration_subtype
  integration_type              = var.apigatewayv2_integration_integration_type
  integration_uri               = var.apigatewayv2_integration_integration_uri
  passthrough_behavior          = var.apigatewayv2_integration_passthrough_behavior
  payload_format_version        = var.apigatewayv2_integration_payload_format_version
  request_parameters            = var.apigatewayv2_integration_request_parameters
  request_templates             = var.apigatewayv2_integration_request_templates
  template_selection_expression = var.apigatewayv2_integration_template_selection_expression
  timeout_milliseconds          = var.apigatewayv2_integration_timeout_milliseconds


  dynamic "response_parameters" {
    for_each = var.apigatewayv2_integration_response_parameters
      content {
        mappings    = response_parameters.value["mappings"]
        status_code = response_parameters.value["status_code"]
      }
  }
  dynamic "tls_config" {
    for_each = var.apigatewayv2_integration_tls_config
      content {
        server_name_to_verify = tls_config.value["server_name_to_verify"] 
      }
  }
}
