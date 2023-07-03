resource "aws_cloudwatch_log_metric_filter" "cloudwatch_log_metric_filter" {
  log_group_name = var.cloudwatch_log_metric_filter_log_group_name
  name           = var.cloudwatch_log_metric_filter_name
  pattern        = var.cloudwatch_log_metric_filter_pattern

  dynamic "metric_transformation" {
    for_each = var.cloudwatch_log_metric_filter_metric_transformation
      content {
        default_value = metric_transformation.value["default_value"]
        dimensions    = metric_transformation.value["dimensions"]
        name          = metric_transformation.value["name"]
        namespace     = metric_transformation.value["namespace"]
        unit          = metric_transformation.value["unit"]
        value         = metric_transformation.value["value"]
      }
  }
}

