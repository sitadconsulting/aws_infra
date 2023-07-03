output "secret_arn" {
  description = "ARN of this secret object"
  value       = element(concat(aws_secretsmanager_secret_rotation.secret_rotation.*.arn, [""]), 0)
}

output "secret_rotation_enabled" {
  description = "Specifies whether automatic rotation is enabled for this secret"
  value       = element(concat(aws_secretsmanager_secret_rotation.secret_rotation.*.rotation_enabled, [""]), 0)
}
