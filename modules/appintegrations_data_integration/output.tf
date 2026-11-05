output "appintegrations_data_integration_arn" {
  description = "ARN of the Data Integration"
  value       = element(concat(aws_appintegrations_data_integration.appintegrations_data_integration.*.arn, [""]), 0)
}
output "appintegrations_data_integration_id" {
  description = "Identifier of the Data Integration"
  value       = element(concat(aws_appintegrations_data_integration.appintegrations_data_integration.*.id, [""]), 0)
}
