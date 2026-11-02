resource "aws_networkflowmonitor_monitor" "networkflowmonitor_monitor" {
  monitor_name    = var.networkflowmonitor_monitor_monitor_name
  scope_arn       = var.networkflowmonitor_monitor_scope_arn
  tags            = var.networkflowmonitor_monitor_tags

  dynamic "local_resource" {
    for_each = var.networkflowmonitor_monitor_local_resource
      content {
        type       = local_resource.value["type"]
        identifier = local_resource.value["identifier"]
      }
  }
  dynamic "remote_resource" {
    for_each = var.networkflowmonitor_monitor_remote_resource
      content {
        type       = remote_resource.value["type"]
        identifier = remote_resource.value["identifier"]
      }
  }
}
