resource "aws_cloudfront_monitoring_subscription" "cloudfront_monitoring_subscription" {
  distribution_id = var.cloudfront_monitoring_subscription_distribution_id


  dynamic "monitoring_subscription" {
    for_each = var.cloudfront_monitoring_subscription_monitoring_subscription
      content {
        dynamic "realtime_metrics_subscription_config" {
          for_each = monitoring_subscription.value.realtime_metrics_subscription_config
            content {
              realtime_metrics_subscription_status = realtime_metrics_subscription_config.value["realtime_metrics_subscription_status"]
            }
        }
      }
  }
}
