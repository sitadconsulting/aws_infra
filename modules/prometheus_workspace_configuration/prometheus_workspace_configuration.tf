resource "aws_prometheus_workspace_configuration" "prometheus_workspace_configuration" {
  retention_period_in_days = var.prometheus_workspace_configuration_retention_period_in_days
  workspace_id             = var.prometheus_workspace_configuration_workspace_id

  dynamic "limits_per_label_set" {
    for_each = var.prometheus_workspace_configuration_limits_per_label_set
      content {
        label_set = limits_per_label_set.value["label_set"]
        dynamic "limits" {
          for_each = limits_per_label_set.value.limits
            content {
              max_series = limits.value["max_series"]
            }
        }
      }
  }
}
