output "ssoadmin_permission_set_inline_policy_id" {
  description = "ARN of the Permission Set and SSO Instance, separated by a comma (,)"
  value       = element(concat(aws_ssoadmin_permission_set_inline_policy.ssoadmin_permission_set_inline_policy.*.id, [""]), 0)
}
