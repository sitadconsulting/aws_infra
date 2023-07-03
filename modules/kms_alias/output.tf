output "kms_alias_arn" {
  description = "ARN of this kms key alias"
  value       = element(concat(aws_kms_alias.kms_alias.*.arn, [""]), 0)
}
output "kms_alias_target_key_arn" {
  description = "ARN of the target key identifier"
  value       = element(concat(aws_kms_alias.kms_alias.*.target_key_arn, [""]), 0)
}
