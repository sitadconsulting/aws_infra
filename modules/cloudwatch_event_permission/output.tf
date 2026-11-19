output "cloudwatch_event_permission_id" {
  description = "The statement ID of the EventBridge permission"
  value       = element(concat(aws_cloudwatch_event_permission.cloudwatch_event_permission.*.id, [""]), 0)
}
