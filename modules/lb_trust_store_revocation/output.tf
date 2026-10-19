output "lb_trust_store_revocation_revocation_id" {
  description = "AWS assigned RevocationId, (number)"
  value       = element(concat(aws_lb_trust_store_revocation.lb_trust_store_revocation.*.revocation_id, [""]), 0)
}
output "lb_trust_store_revocation_revocation_id" {
  description = "combination of the Trust Store ARN and RevocationId {trust_store_arn},{revocation_id}"
  value       = element(concat(aws_lb_trust_store_revocation.lb_trust_store_revocation.*.revocation_id, [""]), 0)
}
