resource "aws_apigatewayv2_stage" "apigatewayv2_stage" {
  api_id                = var.apigatewayv2_stage_api_id
  auto_deploy           = var.apigatewayv2_stage_auto_deploy
  client_certificate_id = var.apigatewayv2_stage_client_certificate_id
  deployment_id         = var.apigatewayv2_stage_deployment_id
  description           = var.apigatewayv2_stage_description
  name                  = var.apigatewayv2_stage_name
  stage_variables       = var.apigatewayv2_stage_stage_variables
  tags                  = var.apigatewayv2_stage_tags

  dynamic "access_log_settings" {
    for_each = var.apigatewayv2_stage_access_log_settings
      content {
        destination_arn = access_log_settings.value["destination_arn"]
        format          = access_log_settings.value["format"]
      }
  }
  dynamic "default_route_settings" {
    for_each = var.apigatewayv2_stage_default_route_settings
      content {
        data_trace_enabled       = default_route_settings.value["data_trace_enabled"]
        detailed_metrics_enabled = default_route_settings.value["detailed_metrics_enabled"]
        logging_level            = default_route_settings.value["logging_level"]
        throttling_burst_limit   = default_route_settings.value["throttling_burst_limit"]
        throttling_rate_limit    = default_route_settings.value["throttling_rate_limit"]
      }
  }
  dynamic "route_settings" {
    for_each = var.apigatewayv2_stage_route_settings
      content {
        data_trace_enabled       = route_settings.value["data_trace_enabled"]
        detailed_metrics_enabled = route_settings.value["detailed_metrics_enabled"]
        logging_level            = route_settings.value["logging_level"]
        route_key                = route_settings.value["route_key"]
        throttling_burst_limit   = route_settings.value["throttling_burst_limit"]
        throttling_rate_limit    = route_settings.value["throttling_rate_limit"]
      }
  }
}
