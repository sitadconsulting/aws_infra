variable "bedrockagent_agent_alias_agent_alias_name" {
  description = "(Required) Name of the alias"
  type        = string
}
variable "bedrockagent_agent_alias_agent_id" {
  description = "(Required, Forces new resource) Identifier of the agent to create an alias for"
  type        = string
}
variable "bedrockagent_agent_alias_description" {
  description = "(Optional) Description of the alias"
  type        = string
  default     = null
}
variable "bedrockagent_agent_alias_tags" {
  description = "Map of tags assigned to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "bedrockagent_agent_alias_routing_configuration" {
  description = "(Optional) Details about the routing configuration of the alias"
  type        = list(object({
    agent_version          = optional(string)
    provisioned_throughput = optional(string)
  }))
  default     = []
}
