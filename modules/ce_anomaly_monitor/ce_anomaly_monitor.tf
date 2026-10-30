resource "aws_ce_anomaly_monitor" "ce_anomaly_monitor" {
  monitor_dimension     = var.ce_anomaly_monitor_monitor_dimension
  monitor_specification = var.ce_anomaly_monitor_monitor_specification
  monitor_type          = var.ce_anomaly_monitor_monitor_type
  name                  = var.ce_anomaly_monitor_name
  tags                  = var.ce_anomaly_monitor_tags
}
