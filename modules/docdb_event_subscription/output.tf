output "docdb_event_subscription_arn" {
  description = "ARN of the DocumentDB event notification subscription"
  value       = element(concat(aws_docdb_event_subscription.docdb_event_subscription.*.arn, [""]), 0)
}
output "docdb_event_subscription_id" {
  description = "The name of the DocumentDB event notification subscription"
  value       = element(concat(aws_docdb_event_subscription.docdb_event_subscription.*.id, [""]), 0)
}
output "docdb_event_subscription_customer_aws_id" {
  description = "The AWS customer account associated with the DocumentDB event notification subscription"
  value       = element(concat(aws_docdb_event_subscription.docdb_event_subscription.*.customer_aws_id, [""]), 0)
}
