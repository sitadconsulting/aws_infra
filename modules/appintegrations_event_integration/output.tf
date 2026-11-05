output "appintegrations_event_integration_arn" {
  description = "ARN of the Event Integration"
  value       = element(concat(aws_appintegrations_event_integration.appintegrations_event_integration.*.arn, [""]), 0)
}
output "appintegrations_event_integration_id" {
  description = "Identifier of the Event Integration which is the name of the Event Integration"
  value       = element(concat(aws_appintegrations_event_integration.appintegrations_event_integration.*.id, [""]), 0)
}
