output "bedrockagent_agent_agent_arn" {
  description = "Agent ARN"
  value       = element(concat(aws_bedrockagent_agent.bedrockagent_agent.*.agent_arn, [""]), 0)
}
output "bedrockagent_agent_agent_id" {
  description = "Agent ID"
  value       = element(concat(aws_bedrockagent_agent.bedrockagent_agent.*.agent_id, [""]), 0)
}
output "bedrockagent_agent_agent_version" {
  description = "Agent Version"
  value       = element(concat(aws_bedrockagent_agent.bedrockagent_agent.*.agent_version, [""]), 0)
}
output "bedrockagent_agent_id" {
  description = "Agent ID"
  value       = element(concat(aws_bedrockagent_agent.bedrockagent_agent.*.id, [""]), 0)
}
output "bedrockagent_agent_prepared_at" {
  description = "Timestamp of when the agent was last prepared"
  value       = element(concat(aws_bedrockagent_agent.bedrockagent_agent.*.prepared_at, [""]), 0)
}
