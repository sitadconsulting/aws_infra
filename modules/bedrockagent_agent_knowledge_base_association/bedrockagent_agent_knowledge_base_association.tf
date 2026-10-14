resource "aws_bedrockagent_agent_knowledge_base_association" "bedrockagent_agent_knowledge_base_association" {
  agent_id             = var.bedrockagent_agent_knowledge_base_association_agent_id
  agent_version        = var.bedrockagent_agent_knowledge_base_association_agent_version
  description          = var.bedrockagent_agent_knowledge_base_association_description
  knowledge_base_id    = var.bedrockagent_agent_knowledge_base_association_knowledge_base_id
  knowledge_base_state = var.bedrockagent_agent_knowledge_base_association_knowledge_base_state
}
