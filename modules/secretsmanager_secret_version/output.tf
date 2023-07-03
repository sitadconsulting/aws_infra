output "secret_arn" {
  description = "ARN of this secret object"
  value       = element(concat(aws_secretsmanager_secret_version.secret_version.*.arn, [""]), 0)
}
output "secret_version_id" {
  description = "The Version_Id of this secret object"
  value       = element(concat(aws_secretsmanager_secret_version.secret_version.*.version_id, [""]), 0)
}
