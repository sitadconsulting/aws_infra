output "datasync_agent_arn" {
  description = "ARN of the DataSync Agent"
  value       = element(concat(aws_datasync_agent.datasync_agent.*.arn, [""]), 0)
}
output "datasync_agent_id" {
  description = "ARN of the DataSync Agent"
  value       = element(concat(aws_datasync_agent.datasync_agent.*.id, [""]), 0)
}
