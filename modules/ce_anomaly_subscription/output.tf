output "ce_anomaly_subscription_arn" {
  description = "ARN of the anomaly subscription"
  value       = element(concat(aws_ce_anomaly_subscription.ce_anomaly_subscription.*.arn, [""]), 0)
}
output "ce_anomaly_subscription_id" {
  description = "Unique ID of the anomaly subscription. Same as arn"
  value       = element(concat(aws_ce_anomaly_subscription.ce_anomaly_subscription.*.id, [""]), 0)
}
