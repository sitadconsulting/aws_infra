output "appconfig_environment_arn" {
  description = "ARN of the AppConfig Environment"
  value       = element(concat(aws_appconfig_environment.appconfig_environment.*.arn, [""]), 0)
}
output "appconfig_environment_environment_id" {
  description = "AppConfig environment ID"
  value       = element(concat(aws_appconfig_environment.appconfig_environment.*.environment_id, [""]), 0)
}
output "appconfig_environment_state" {
  description = "State of the environment. Possible values are READY_FOR_DEPLOYMENT, DEPLOYING, ROLLING_BACK or ROLLED_BACK"
  value       = element(concat(aws_appconfig_environment.appconfig_environment.*.state, [""]), 0)
}
