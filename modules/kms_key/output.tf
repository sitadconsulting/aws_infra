output "kms_key_arn" {
  description = "ARN of this kms key"
  value       = element(concat(aws_kms_key.kms_key.*.arn, [""]), 0)
}
output "kms_key_key_id" {
  description = "The globally unique identifier for the key"
  value       = element(concat(aws_kms_key.kms_key.*.key_id, [""]), 0)
}
