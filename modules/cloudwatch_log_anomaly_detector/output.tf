output "cloudwatch_log_anomaly_detector_arn" {
  description = "ARN of the log anomaly detector that you just created"
  value       = element(concat(aws_cloudwatch_log_anomaly_detector.cloudwatch_log_anomaly_detector.*.arn, [""]), 0)
}
