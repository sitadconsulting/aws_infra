output "config_aggregate_authorization_arn" {
  description = "The ARN of the authorization"
  value       = element(concat(aws_config_aggregate_authorization.config_aggregate_authorization.*.arn, [""]), 0)
}
