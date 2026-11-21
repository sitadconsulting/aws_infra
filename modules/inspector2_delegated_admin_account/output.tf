output "inspector2_delegated_admin_account_relationship_status" {
  description = "Status of this delegated admin account"
  value       = element(concat(aws_inspector2_delegated_admin_account.inspector2_delegated_admin_account.*.relationship_status, [""]), 0)
}
