output "dms_event_subscription_arn" {
  description = "ARN of the DMS Event Subscription"
  value       = element(concat(aws_dms_event_subscription.dms_event_subscription.*.arn, [""]), 0)
}
