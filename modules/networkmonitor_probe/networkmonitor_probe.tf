resource "aws_networkmonitor_probe" "networkmonitor_probe" {
  destination      = var.networkmonitor_probe_destination
  destination_port = var.networkmonitor_probe_destination_port
  monitor_name     = var.networkmonitor_probe_monitor_name
  protocol         = var.networkmonitor_probe_protocol
  source_arn       = var.networkmonitor_probe_source_arn
  packet_size      = var.networkmonitor_probe_packet_size
  tags             = var.networkmonitor_probe_tags
}
