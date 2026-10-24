output "flow_log_arn" {
  description = "ARN of the Flow Log"
  value       = element(concat(aws_flow_log.flow_log.*.arn, [""]), 0)
}
output "flow_log_id" {
  description = "Flow Log ID"
  value       = element(concat(aws_flow_log.flow_log.*.id, [""]), 0)
}
