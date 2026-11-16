output "detective_organization_admin_account_id" {
  description = "AWS account identifier"
  value       = element(concat(aws_detective_organization_admin_account.detective_organization_admin_account.*.id, [""]), 0)
}
