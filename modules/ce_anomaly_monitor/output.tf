output "ce_anomaly_monitor_arn" {
  description = "ARN of the anomaly monitor"
  value       = element(concat(aws_ce_anomaly_monitor.ce_anomaly_monitor.*.arn, [""]), 0)
}
output "ce_anomaly_monitor_id" {
  description = "Unique ID of the anomaly monitor. Same as arn"
  value       = element(concat(aws_ce_anomaly_monitor.ce_anomaly_monitor.*.id, [""]), 0)
}
