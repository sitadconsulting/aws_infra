resource "aws_cloudwatch_metric_stream" "cloudwatch_metric_stream" {
  firehose_arn                    = var.cloudwatch_metric_stream_firehose_arn 
  include_linked_accounts_metrics = var.cloudwatch_metric_stream_include_linked_accounts_metrics
  name                            = var.cloudwatch_metric_stream_name
  name_prefix                     = var.cloudwatch_metric_stream_name_prefix
  output_format                   = var.cloudwatch_metric_stream_output_format
  role_arn                        = var.cloudwatch_metric_stream_role_arn
  tags                            = var.cloudwatch_metric_stream_tags

  dynamic "exclude_filter" {
    for_each = var.cloudwatch_metric_stream_exclude_filter
      content {
        metric_names = exclude_filter.value["metric_names"]
        namespace    = exclude_filter.value["namespace"]
      }
  }
  dynamic "include_filter" {
    for_each = var.cloudwatch_metric_stream_include_filter
      content {
        metric_names = include_filter.value["metric_names"]
        namespace    = include_filter.value["namespace"]
      }
  }
  dynamic "statistics_configuration" {
    for_each = var.cloudwatch_metric_stream_statistics_configuration
      content {
        additional_statistics = statistics_configuration.value["additional_statistics"]
        dynamic "include_metric" {
          for_each = statistics_configuration.value.include_metric
            content {
              metric_names = include_metric.value["metric_names"]
              namespace    = include_metric.value["namespace"]
            }
        } 
      }
  }
}
