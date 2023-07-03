output "kms_grant_id" {
  description = "The unique identifier for the grant"
  value       = element(concat(aws_kms_grant.kms_grant.*.id, [""]), 0)
}
output "kms_grant_grant_token" {
  description = "The grant token for the created grant. For more information"
  value       = element(concat(aws_kms_grant.kms_grant.*.grant_token, [""]), 0)
}
