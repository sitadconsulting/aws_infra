output "secret_arn" {
  description = "ARN of this secret object"
  value       = element(concat(aws_secretsmanager_secret_policy.secret_policy.*.id, [""]), 0)
}

