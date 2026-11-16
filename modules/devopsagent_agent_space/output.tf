output "devopsagent_agent_space_agent_space_id" {
  description = "Unique identifier of the Agent Space"
  value       = element(concat(aws_devopsagent_agent_space.devopsagent_agent_space.*.agent_space_id, [""]), 0)
}
output "devopsagent_agent_space_arn" {
  description = "ARN of the Agent Space"
  value       = element(concat(aws_devopsagent_agent_space.devopsagent_agent_space.*.arn, [""]), 0)
}
output "devopsagent_agent_space_created_at" {
  description = "Timestamp when the Agent Space was created"
  value       = element(concat(aws_devopsagent_agent_space.devopsagent_agent_space.*.created_at, [""]), 0)
}
output "devopsagent_agent_space_updated_at" {
  description = "Timestamp when the Agent Space was last updated"
  value       = element(concat(aws_devopsagent_agent_space.devopsagent_agent_space.*.updated_at, [""]), 0)
}
