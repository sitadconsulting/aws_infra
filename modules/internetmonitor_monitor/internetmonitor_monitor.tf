resource "aws_internetmonitor_monitor" "internetmonitor_monitor" {
  max_city_networks_to_monitor       = var.internetmonitor_monitor_max_city_networks_to_monitor
  monitor_name                       = var.internetmonitor_monitor_monitor_name
  resources                          = var.internetmonitor_monitor_resources
  status                             = var.internetmonitor_monitor_status
  tags                               = var.internetmonitor_monitor_tags
  traffic_percentage_to_monitor      = var.internetmonitor_monitor_traffic_percentage_to_monitor

  dynamic "health_events_config" {
    for_each = var.internetmonitor_monitor_health_events_config
      content {
        availability_score_threshold = health_events_config.value["availability_score_threshold"]
        performance_score_threshold  = health_events_config.value["performance_score_threshold"]
      }
  }
  dynamic "internet_measurements_log_delivery" {
    for_each = var.internetmonitor_monitor_internet_measurements_log_delivery
      content {
        dynamic "s3_config" {
          for_each = internet_measurements_log_delivery.value.s3_config
            content {
              bucket_name         = s3_config.value["bucket_name"]
              bucket_prefix       = s3_config.value["bucket_prefix"]
              log_delivery_status = s3_config.value["log_delivery_status"]
            }
        }
      }
  }
}
