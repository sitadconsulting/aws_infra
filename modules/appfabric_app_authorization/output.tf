output "appfabric_app_authorization_arn" {
  description = "ARN of the App Authorization"
  value       = element(concat(aws_appfabric_app_authorization.appfabric_app_authorization.*.arn, [""]), 0)
}
output "appfabric_app_authorization_auth_url" {
  description = "Application URL for the OAuth flow"
  value       = element(concat(aws_appfabric_app_authorization.appfabric_app_authorization.*.auth_url, [""]), 0)
}
output "appfabric_app_authorization_created_at" {
  description = "Timestamp of when the app authorization was created"
  value       = element(concat(aws_appfabric_app_authorization.appfabric_app_authorization.*.created_at, [""]), 0)
}
output "appfabric_app_authorization_persona" {
  description = "User persona of the app authorization"
  value       = element(concat(aws_appfabric_app_authorization.appfabric_app_authorization.*.persona, [""]), 0)
}
output "appfabric_app_authorization_updated_at" {
  description = "Timestamp of when the app authorization was last updated"
  value       = element(concat(aws_appfabric_app_authorization.appfabric_app_authorization.*.updated_at, [""]), 0)
}
