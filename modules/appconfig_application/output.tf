output "appconfig_application_arn" {
  description = "ARN of the AppConfig Application"
  value       = element(concat(aws_appconfig_application.appconfig_application.*.arn, [""]), 0)
}
output "appconfig_application_id" {
  description = "AppConfig application ID"
  value       = element(concat(aws_appconfig_application.appconfig_application.*.id, [""]), 0)
}
