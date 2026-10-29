resource "aws_autoscaling_traffic_source_attachment" "autoscaling_traffic_source_attachment" {
  autoscaling_group_name = var.autoscaling_traffic_source_attachment_autoscaling_group_name

  dynamic "traffic_source" {
    for_each = var.autoscaling_traffic_source_attachment_traffic_source
      content {
        identifier = traffic_source.value["identifier"]
        type       = traffic_source.value["type"]
      }
  }
}
