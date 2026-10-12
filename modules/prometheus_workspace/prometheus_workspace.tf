resource "aws_prometheus_workspace" "prometheus_workspace" {
  alias       = var.prometheus_workspace_alias
  kms_key_arn = var.prometheus_workspace_kms_key_arn
  tags        = var.prometheus_workspace_tags


  dynamic "logging_configuration" {
    for_each = var.prometheus_workspace_logging_configuration
      content {
        log_group_arn = logging_configuration.value["log_group_arn"]
      }
  }
}
