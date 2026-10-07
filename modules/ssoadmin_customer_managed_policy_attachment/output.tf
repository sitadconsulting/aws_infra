output "ssoadmin_customer_managed_policy_attachment_id" {
  description = "Policy Name, Policy Path, Permission Set Amazon Resource Name (ARN), and SSO Instance ARN, each separated by a comma (,)"
  value       = element(concat(aws_ssoadmin_customer_managed_policy_attachment.ssoadmin_customer_managed_policy_attachment.*.id, [""]), 0)
}
