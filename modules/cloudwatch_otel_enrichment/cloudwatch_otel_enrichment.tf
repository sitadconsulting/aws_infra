resource "aws_cloudwatch_otel_enrichment" "cloudwatch_otel_enrichment" {
  dynamic "exclude_filter" {
    for_each = var.cloudwatch_otel_enrichment_exclude_filter
      content {
        metric_names = exclude_filter.value["metric_names"]
        namespace    = exclude_filter.value["namespace"]
      }
  }
  dynamic "include_filter" {
    for_each = var.cloudwatch_otel_enrichment_include_filter
      content {
        metric_names = include_filter.value["metric_names"]
        namespace    = include_filter.value["namespace"]
      }
  }
}
