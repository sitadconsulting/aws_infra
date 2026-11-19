output "cloudwatch_event_bus_policy_id" {
  description = "The name of the EventBridge event bus"
  value       = element(concat(aws_cloudwatch_event_bus_policy.cloudwatch_event_bus_policy.*.id, [""]), 0)
}
