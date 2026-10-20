output "iam_security_token_service_preferences_id" {
  description = "The AWS Account ID"
  value       = element(concat(aws_iam_security_token_service_preferences.iam_security_token_service_preferences.*.id, [""]), 0)
}
