output "bedrockagent_agent_alias_agent_alias_arn" {
  description = "ARN of the alias"
  value       = element(concat(aws_bedrockagent_agent_alias.bedrockagent_agent_alias.*.agent_alias_arn, [""]), 0)
}
output "bedrockagent_agent_alias_agent_alias_id" {
  description = "Unique identifier of the alias"
  value       = element(concat(aws_bedrockagent_agent_alias.bedrockagent_agent_alias.*.agent_alias_id, [""]), 0)
}
output "bedrockagent_agent_alias_id" {
  description = "Alias ID and agent ID separated by"
  value       = element(concat(aws_bedrockagent_agent_alias.bedrockagent_agent_alias.*.id, [""]), 0)
}
