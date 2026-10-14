output "bedrockagent_agent_knowledge_base_association_id" {
  description = "Agent ID, agent version, and knowledge base ID separated by ,"
  value       = element(concat(aws_bedrockagent_agent_knowledge_base_association.bedrockagent_agent_knowledge_base_association.*.id, [""]), 0)
}
