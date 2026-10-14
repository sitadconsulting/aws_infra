output "bedrockagent_agent_collaborator_collaborator_id" {
  description = "ID of the Agent Collaborator"
  value       = element(concat(aws_bedrockagent_agent_collaborator.bedrockagent_agent_collaborator.*.collaborator_id, [""]), 0)
}
