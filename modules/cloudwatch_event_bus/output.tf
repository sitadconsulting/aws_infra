output "cloudwatch_event_bus_arn" {
  description = "ARN of the event bus"
  value       = element(concat(aws_cloudwatch_event_bus.cloudwatch_event_bus.*.arn, [""]), 0)
}
output "cloudwatch_event_bus_id" {
  description = "Name of the event bus"
  value       = element(concat(aws_cloudwatch_event_bus.cloudwatch_event_bus.*.id, [""]), 0)
}
