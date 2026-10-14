output "bedrockagent_agent_action_group_action_group_id" {
  description = "Action Group ID"
  value       = element(concat(aws_bedrockagent_agent_action_group.bedrockagent_agent_action_group.*.action_group_id, [""]), 0)
}
output "bedrockagent_agent_action_group_id" {
  description = "Action group ID, agent ID, and agent version separated by ,."
  value       = element(concat(aws_bedrockagent_agent_action_group.bedrockagent_agent_action_group.*.id, [""]), 0)
}
