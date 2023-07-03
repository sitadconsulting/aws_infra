output "db_event_subscription_id" {
  description = "The name of the RDS event notification subscription"
  value       = element(concat(aws_db_event_subscription.db_event_subscription.*.id, [""]), 0)
}
output "db_event_subscription_arn" {
  description = "ARN of the RDS event notification subscription"
  value       = element(concat(aws_db_event_subscription.db_event_subscription.*.arn, [""]), 0)
}
output "db_event_subscription_customer_aws_id" {
  description = "The AWS customer account associated with the RDS event notification subscription"
  value       = element(concat(aws_db_event_subscription.db_event_subscription.*.customer_aws_id, [""]), 0)
}
