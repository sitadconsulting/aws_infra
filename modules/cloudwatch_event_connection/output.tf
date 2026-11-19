output "cloudwatch_event_connection_arn" {
  description = "ARN of the connection"
  value       = element(concat(aws_cloudwatch_event_connection.cloudwatch_event_connection.*.arn, [""]), 0)
}
output "cloudwatch_event_connection_secret_arn" {
  description = "ARN of the secret created from the authorization parameters specified for the connection"
  value       = element(concat(aws_cloudwatch_event_connection.cloudwatch_event_connection.*.secret_arn, [""]), 0)
}
