output "kms_replica_key_arn" {
  description = "ARN of the replica key"
  value       = element(concat(aws_kms_replica_key.kms_replica_key.*.arn, [""]), 0)
}
output "kms_replica_key_key_id" {
  description = "The key ID of the replica key. Related multi-Region keys have the same key ID"
  value       = element(concat(aws_kms_replica_key.kms_replica_key.*.key_id, [""]), 0)
}
output "kms_replica_key_key_rotation_enabled" {
  description = "A Boolean value that specifies whether key rotation is enabled. This is a shared property of multi-Region keys"
  value       = element(concat(aws_kms_replica_key.kms_replica_key.*.key_rotation_enabled, [""]), 0)
}
output "kms_replica_key_key_spec" {
  description = "The type of key material in the KMS key. This is a shared property of multi-Region keys"
  value       = element(concat(aws_kms_replica_key.kms_replica_key.*.key_spec, [""]), 0)
}
output "kms_replica_key_key_usage" {
  description = "The cryptographic operations for which you can use the KMS key. This is a shared property of multi-Region keys"
  value       = element(concat(aws_kms_replica_key.kms_replica_key.*.key_usage, [""]), 0)
}

