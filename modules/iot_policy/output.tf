output "iot_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = element(concat(aws_iot_policy.iot_policy.*.arn, [""]), 0)
}
output "iot_policy_name" {
  description = "The name of this policy"
  value       = element(concat(aws_iot_policy.iot_policy.*.name, [""]), 0)
}
output "iot_policy_default_version_id" {
  description = "The default version of this policy"
  value       = element(concat(aws_iot_policy.iot_policy.*.default_version_id, [""]), 0)
}
output "iot_policy_policy" {
  description = "The policy document"
  value       = element(concat(aws_iot_policy.iot_policy.*.policy, [""]), 0)
}
