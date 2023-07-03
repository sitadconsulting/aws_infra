output "kms_replica_external_key_arn" {
  description = "ARN of the replica external key"
  value       = element(concat(aws_kms_replica_external_key.kms_replica_external_key.*.arn, [""]), 0)
}
output "kms_replica_external_key_expiration_model" {
  description = "Whether the key material expires. Empty when pending key material import, otherwise KEY_MATERIAL_EXPIRES or KEY_MATERIAL_DOES_NOT_EXPIRE"
  value       = element(concat(aws_kms_replica_external_key.kms_replica_external_key.*.expiration_model, [""]), 0)
}
output "kms_replica_external_key_key_id" {
  description = "The key ID of the replica key. Related multi-Region keys have the same key ID"
  value       = element(concat(aws_kms_replica_external_key.kms_replica_external_key.*.key_id, [""]), 0)
}
output "kms_replica_external_key_key_state" {
  description = "The state of the replica key"
  value       = element(concat(aws_kms_replica_external_key.kms_replica_external_key.*.key_state, [""]), 0)
}
output "kms_replica_external_key_key_usage" {
  description = "The cryptographic operations for which you can use the KMS key. This is a shared property of multi-Region keys"
  value       = element(concat(aws_kms_replica_external_key.kms_replica_external_key.*.key_usage, [""]), 0)
}
