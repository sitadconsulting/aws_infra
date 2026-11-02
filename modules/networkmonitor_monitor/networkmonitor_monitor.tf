resource "aws_networkmonitor_monitor" "networkmonitor_monitor" {
  aggregation_period = var.networkmonitor_monitor_aggregation_period
  monitor_name       = var.networkmonitor_monitor_monitor_name
  tags               = var.networkmonitor_monitor_tags
}
