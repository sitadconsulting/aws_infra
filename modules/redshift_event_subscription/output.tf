output "redshift_event_subscription_arn" {
  description = "ARN of the Redshift event notification subscription"
  value       = element(concat(aws_redshift_event_subscription.redshift_event_subscription.*.arn, [""]), 0)
}
output "redshift_event_subscription_id" {
  description = "The name of the Redshift event notification subscription"
  value       = element(concat(aws_redshift_event_subscription.redshift_event_subscription.*.id, [""]), 0)
}
output "redshift_event_subscription_customer_aws_id" {
  description = "The AWS customer account associated with the Redshift event notification subscription"
  value       = element(concat(aws_redshift_event_subscription.redshift_event_subscription.*.customer_aws_id, [""]), 0)
}
