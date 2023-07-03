output "quicksight_account_subscription_account_subscription_status" {
  description = "Status of the Amazon QuickSight account's"
  value       = element(concat(aws_quicksight_account_subscription.quicksight_account_subscription.*.account_subscription_status, [""]), 0)
}
