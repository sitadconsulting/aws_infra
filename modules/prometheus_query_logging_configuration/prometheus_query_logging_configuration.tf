resource "aws_prometheus_query_logging_configuration" "prometheus_query_logging_configuration" {
  workspace_id = var.prometheus_query_logging_configuration_workspace_id

  dynamic "destination" {
    for_each = var.prometheus_query_logging_configuration_destination
      content {
        dynamic "cloudwatch_logs" {
          for_each = destination.value.cloudwatch_logs
            content {
              log_group_arn = cloudwatch_logs.value["log_group_arn"]
            }
        }
        dynamic "filters" {
          for_each = destination.value.filters
            content {
              qsp_threshold = filters.value["qsp_threshold"]
            }
        }
      }
  }
}
