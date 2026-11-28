output "macie2_organization_admin_account_id" {
  description = "Unique identifier (ID) of the Macie organization admin account"
  value       = element(concat(aws_macie2_organization_admin_account.macie2_organization_admin_account.*.id, [""]), 0)
}
