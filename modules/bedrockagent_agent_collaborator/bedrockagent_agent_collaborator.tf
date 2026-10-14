resource "aws_bedrockagent_agent_collaborator" "bedrockagent_agent_collaborator" {
  agent_id                   = var.bedrockagent_agent_collaborator_agent_id
  agent_version              = var.bedrockagent_agent_collaborator_agent_version
  collaboration_instruction  = var.bedrockagent_agent_collaborator_collaboration_instruction
  collaborator_name          = var.bedrockagent_agent_collaborator_collaborator_name
  prepare_agent              = var.bedrockagent_agent_collaborator_prepare_agent
  relay_conversation_history = var.bedrockagent_agent_collaborator_relay_conversation_history

  dynamic "agent_descriptor" {
    for_each = var.bedrockagent_agent_collaborator_agent_descriptor
      content {
        alias_arn = agent_descriptor.value["alias_arn"]
      }
  }
}
