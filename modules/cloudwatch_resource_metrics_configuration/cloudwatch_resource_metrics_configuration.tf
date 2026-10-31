resource "aws_cloudwatch_resource_metrics_configuration" "cloudwatch_resource_metrics_configuration" {
  resource_arn = var.cloudwatch_resource_metrics_configuration_resource_arn
  
  dynamic "metric_selection" {
    for_each = var.cloudwatch_resource_metrics_configuration_metric_selection
      content {
        include_metrics = metric_selection.value["include_metrics"]
      }
  }
}
