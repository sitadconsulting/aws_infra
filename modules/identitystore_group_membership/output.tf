output "identitystore_group_membership_membership_id" {
  description = "The identifier of the newly created group membership in the Identity Store"
  value       = element(concat(aws_identitystore_group_membership.identitystore_group_membership.*.membership_id, [""]), 0)
}
