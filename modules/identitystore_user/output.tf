output "identitystore_user_external_ids" {
  description = "A list of identifiers issued to this resource by an external identity provider"
  value       = element(concat(aws_identitystore_user.identitystore_user.*.external_ids, [""]), 0)
}
output "identitystore_user_user_id" {
  description = "The identifier for this user in the identity store"
  value       = element(concat(aws_identitystore_user.identitystore_user.*.user_id, [""]), 0)
}
