output "inspector2_member_association_delegated_admin_account_id" {
  description = "Account ID of the delegated administrator account"
  value       = element(concat(aws_inspector2_member_association.inspector2_member_association.*.delegated_admin_account_id, [""]), 0)
}
output "inspector2_member_association_relationship_status" {
  description = "Status of the member relationship"
  value       = element(concat(aws_inspector2_member_association.inspector2_member_association.*.relationship_status, [""]), 0)
}
output "inspector2_member_association_updated_at" {
  description = "Date and time of the last update of the relationship"
  value       = element(concat(aws_inspector2_member_association.inspector2_member_association.*.updated_at, [""]), 0)
}
