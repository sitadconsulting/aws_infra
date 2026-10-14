variable "bedrockagent_agent_collaborator_agent_id" {
  description = "(Required) ID if the agent to associate the collaborator"
  type        = string
}
variable "bedrockagent_agent_collaborator_agent_version" {
  description = "(Optional) Version of the agent to associate the collaborator. Defaults to DRAFT"
  type        = string
  default     = "DRAFT"
}
variable "bedrockagent_agent_collaborator_collaboration_instruction" {
  description = "(Required) Instruction to give the collaborator"
  type        = string
}
variable "bedrockagent_agent_collaborator_collaborator_name" {
  description = "(Required) Name of this collaborator"
  type        = string
}
variable "bedrockagent_agent_collaborator_prepare_agent" {
  description = "(Optional) Whether to prepare the agent after creation or modification. Defaults to true"
  type        = bool
  default     = true
}
variable "bedrockagent_agent_collaborator_relay_conversation_history" {
  description = "(Optional) Configure relaying the history to the collaborator"
  type        = string
  default     = null
}
variable "bedrockagent_agent_collaborator_agent_descriptor" {
  description = "(Required) Agent descriptor"
  type        = list(object({
    alias_arn = string
  }))
}

