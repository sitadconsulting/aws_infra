output "cloudfront_monitoring_subscription_id" {
  description = "The ID of the CloudFront monitoring subscription, which corresponds to the distribution_id"
  value       = element(concat(aws_cloudfront_monitoring_subscription.cloudfront_monitoring_subscription.*.id, [""]), 0)
}
