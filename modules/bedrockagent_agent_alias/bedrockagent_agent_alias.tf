resource "aws_bedrockagent_agent_alias" "bedrockagent_agent_alias" {
  agent_alias_name = var.bedrockagent_agent_alias_agent_alias_name
  agent_id         = var.bedrockagent_agent_alias_agent_id
  description      = var.bedrockagent_agent_alias_description
  tags             = var.bedrockagent_agent_alias_tags

  dynamic "routing_configuration" {
    for_each = var.bedrockagent_agent_alias_routing_configuration
      content {
        agent_version          = routing_configuration.value["agent_version"]
        provisioned_throughput = routing_configuration.value["provisioned_throughput"]
      }
  }
}
