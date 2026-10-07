output "identitystore_group_group_id" {
  description = "The identifier of the newly created group in the identity store"
  value       = element(concat(aws_identitystore_group.identitystore_group.*.group_id, [""]), 0)
}
output "identitystore_group_external_ids" {
  description = "A list of external IDs that contains the identifiers issued to this resource by an external identity provider"
  value       = element(concat(aws_identitystore_group.identitystore_group.*.external_ids, [""]), 0)
}
