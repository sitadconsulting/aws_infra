output "vpclattice_access_log_subscription_id" {
  description = "ID of the access log subscription"
  value       = element(concat(aws_vpclattice_access_log_subscription.vpclattice_access_log_subscription.*.id, [""]), 0)
}
output "vpclattice_access_log_subscription_arn" {
  description = "Amazon Resource Name (ARN) of the access log subscription"
  value       = element(concat(aws_vpclattice_access_log_subscription.vpclattice_access_log_subscription.*.arn, [""]), 0)
}
output "vpclattice_access_log_subscription_destination_arn" {
  description = "Amazon Resource Name (ARN) of the log destination"
  value       = element(concat(aws_vpclattice_access_log_subscription.vpclattice_access_log_subscription.*.destination_arn, [""]), 0)
}
