output "lambdaweb_function_revision_arn" {
  description = "ARN of the revision"
  value       = element(concat(aws_lambdaweb_function_revision.lambdaweb_function_revision.*.arn, [""]), 0)
}
output "lambdaweb_function_revision_revision_id" {
  description = "ID of the revision"
  value       = element(concat(aws_lambdaweb_function_revision.lambdaweb_function_revision.*.revision_id, [""]), 0)
}
output "lambdaweb_function_revision_service_config_application_log_level" {
  description = "Log level for application logs emitted by the web function"
  value       = element(concat([ for v in aws_lambdaweb_function_revision.lambdaweb_function_revision.service_config.telemetry_config_actual.logging_config: v.application_log_level ], [""]), 0)
}
output "lambdaweb_function_revision_service_config_log_group" {
  description = "Name of the Amazon CloudWatch Logs log group the web function sends logs to"
  value       = element(concat([ for v in aws_lambdaweb_function_revision.lambdaweb_function_revision.service_config.telemetry_config_actual.logging_config: v.log_group ], [""]), 0)
}
output "lambdaweb_function_revision_service_config_system_log_level" {
  description = "Log level for system logs emitted by the Lambda runtime"
  value       = element(concat([ for v in aws_lambdaweb_function_revision.lambdaweb_function_revision.service_config.telemetry_config_actual.logging_config: v.system_log_level ], [""]), 0)
}
