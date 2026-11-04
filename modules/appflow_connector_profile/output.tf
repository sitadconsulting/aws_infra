output "appflow_connector_profile_arn" {
  description = "ARN of the connector profile"
  value       = element(concat(aws_appflow_connector_profile.appflow_connector_profile.*.arn, [""]), 0)
}
output "appflow_connector_profile_credentials_arn" {
  description = "ARN of the connector profile credentials"
  value       = element(concat(aws_appflow_connector_profile.appflow_connector_profile.*.credentials_arn, [""]), 0)
}
