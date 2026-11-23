output "iot_billing_group_arn" {
  description = "The ARN of the Billing Group"
  value       = element(concat(aws_iot_billing_group.iot_billing_group.*.arn, [""]), 0)
}
output "iot_billing_group_id" {
  description = "The Billing Group ID"
  value       = element(concat(aws_iot_billing_group.iot_billing_group.*.id, [""]), 0)
}
output "iot_billing_group_version" {
  description = "The current version of the Billing Group record in the registry"
  value       = element(concat(aws_iot_billing_group.iot_billing_group.*.version, [""]), 0)
}
