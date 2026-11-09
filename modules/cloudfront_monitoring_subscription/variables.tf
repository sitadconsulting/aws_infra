variable "cloudfront_monitoring_subscription_distribution_id" {
  description = "(Required) The ID of the distribution that you are enabling metrics for" 
  type        = string
}
variable "cloudfront_monitoring_subscription_monitoring_subscription" {
  description = "(Required) A monitoring subscription. This structure contains information about whether additional CloudWatch metrics are enabled for a given CloudFront distribution"
  type        = list(object({
    realtime_metrics_subscription_config = list(object({
      realtime_metrics_subscription_status = string
    }))
  }))
}
