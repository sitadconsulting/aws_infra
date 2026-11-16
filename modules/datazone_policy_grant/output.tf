output "datazone_policy_grant_created_at" {
  description = "Timestamp when the policy grant was created (RFC3339 format)"
  value       = element(concat(aws_datazone_policy_grant.datazone_policy_grant.*.created_at, [""]), 0)
}
output "datazone_policy_grant_created_by" {
  description = "User who created the policy grant"
  value       = element(concat(aws_datazone_policy_grant.datazone_policy_grant.*.created_by, [""]), 0)
}
output "datazone_policy_grant_grant_id" {
  description = "Identifier of the policy grant"
  value       = element(concat(aws_datazone_policy_grant.datazone_policy_grant.*.grant_id, [""]), 0)
}
