output "ssoadmin_managed_policy_attachment_id" {
  description = "ARN of the Managed Policy, Permission Set, and SSO Instance, separated by a comma (,)"
  value       = element(concat(aws_ssoadmin_managed_policy_attachment.ssoadmin_managed_policy_attachment.*.id, [""]), 0)
}
output "ssoadmin_managed_policy_attachment_managed_policy_name" {
  description = "Managed Policy IAM name"
  value       = element(concat(aws_ssoadmin_managed_policy_attachment.ssoadmin_managed_policy_attachment.*.managed_policy_name, [""]), 0)
}
