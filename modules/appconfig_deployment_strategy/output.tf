output "appconfig_deployment_strategy_arn" {
  description = "ARN of the AppConfig Deployment Strategy"
  value       = element(concat(aws_appconfig_deployment_strategy.appconfig_deployment_strategy.*.arn, [""]), 0)
}
output "appconfig_deployment_strategy_id" {
  description = "AppConfig deployment strategy ID"
  value       = element(concat(aws_appconfig_deployment_strategy.appconfig_deployment_strategy.*.id, [""]), 0)
}
