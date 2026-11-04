output "appconfig_deployment_arn" {
  description = "ARN of the AppConfig Deployment"
  value       = element(concat(aws_appconfig_deployment.appconfig_deployment.*.arn, [""]), 0)
}
output "appconfig_deployment_deployment_number" {
  description = "Deployment number"
  value       = element(concat(aws_appconfig_deployment.appconfig_deployment.*.deployment_number, [""]), 0)
}
output "appconfig_deployment_id" {
  description = "AppConfig application ID, environment ID, and deployment number separated by a slash (/)"
  value       = element(concat(aws_appconfig_deployment.appconfig_deployment.*.id, [""]), 0)
}
output "appconfig_deployment_kms_key_arn" {
  description = "ARN of the KMS key used to encrypt configuration data"
  value       = element(concat(aws_appconfig_deployment.appconfig_deployment.*.kms_key_arn, [""]), 0)
}
output "appconfig_deployment_state" {
  description = "State of the deployment"
  value       = element(concat(aws_appconfig_deployment.appconfig_deployment.*.state, [""]), 0)
}
