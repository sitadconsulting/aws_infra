output "cloudfront_realtime_log_config_arn" {
  description = "ARN of the CloudFront real-time log configuration"
  value       = element(concat(aws_cloudfront_realtime_log_config.cloudfront_realtime_log_config.*.arn, [""]), 0)
}
output "cloudfront_realtime_log_config_id" {
  description = "The ID of the CloudFront real-time log configuration"
  value       = element(concat(aws_cloudfront_realtime_log_config.cloudfront_realtime_log_config.*.id, [""]), 0)
}
