resource "aws_rum_app_monitor" "rum_app_monitor" {
  name           = var.rum_app_monitor_name
  cw_log_enabled = var.rum_app_monitor_cw_log_enabled
  domain         = var.rum_app_monitor_domain   
  domain_list    = var.rum_app_monitor_domain_list
  tags           = var.rum_app_monitor_tags


  dynamic "app_monitor_configuration" {
    for_each = var.rum_app_monitor_app_monitor_configuration
      content {
        allow_cookies       = app_monitor_configuration.value["allow_cookies"]
        enable_xray         = app_monitor_configuration.value["enable_xray"]
        excluded_pages      = app_monitor_configuration.value["excluded_pages"]
        favorite_pages      = app_monitor_configuration.value["favorite_pages"]
        guest_role_arn      = app_monitor_configuration.value["guest_role_arn"]
        identity_pool_id    = app_monitor_configuration.value["identity_pool_id"]
        included_pages      = app_monitor_configuration.value["included_pages"]
        session_sample_rate = app_monitor_configuration.value["session_sample_rate"]
        telemetries         = app_monitor_configuration.value["telemetries"]
      }
  }
  dynamic "custom_events" {
    for_each = var.rum_app_monitor_custom_events
      content {
        status = custom_events.value["status"]
      }
  }
}
