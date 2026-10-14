variable "bedrockagent_agent_knowledge_base_association_agent_id" {
  description = "(Required, Forces new resource) Unique identifier of the agent with which you want to associate the knowledge base"
  type        = string
}
variable "bedrockagent_agent_knowledge_base_association_agent_version" {
  description = "(Optional, Forces new resource) Version of the agent with which you want to associate the knowledge base. Valid values: DRAFT"
  type        = string
  default     = null
}
variable "bedrockagent_agent_knowledge_base_association_description" {
  description = "(Required) Description of what the agent should use the knowledge base for"
  type        = string
}
variable "bedrockagent_agent_knowledge_base_association_knowledge_base_id" {
  description = "(Required, Forces new resource) Unique identifier of the knowledge base to associate with the agent"
  type        = string
}
variable "bedrockagent_agent_knowledge_base_association_knowledge_base_state" {
  description = "(Required) Whether to use the knowledge base when sending an InvokeAgent request. Valid values: ENABLED, DISABLED"
  type        = string 
}
