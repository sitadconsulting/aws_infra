variable "bedrockagent_agent_agent_name" {
  description = "(Required) Name of the agent"
  type        = string
}
variable "bedrockagent_agent_agent_collaboration" {
  description = "(Optional) Agents collaboration role. Valid values: SUPERVISOR, SUPERVISOR_ROUTER, DISABLED"
  type        = string
  default     = null
}
variable "bedrockagent_agent_agent_resource_role_arn" {
  description = "(Required) ARN of the IAM role with permissions to invoke API operations on the agent"
  type        = string
}
variable "bedrockagent_agent_customer_encryption_key_arn" {
  description = "(Optional) ARN of the AWS KMS key that encrypts the agent"
  type        = string
  default     = null
}
variable "bedrockagent_agent_description" {
  description = "(Optional) Description of the agent"
  type        = string 
  default     = null
}
variable "bedrockagent_agent_foundation_model" {
  description = "(Required) Foundation model used for orchestration by the agent"
  type        = string
}
variable "bedrockagent_agent_idle_session_ttl_in_seconds" {
  description = "(Optional) Number of seconds for which Amazon Bedrock keeps information about a user's conversation with the agent. A user interaction remains active for the amount of time specified. If no conversation occurs during this time, the session expires and Amazon Bedrock deletes any data provided before the timeout"
  type        = number
  default     = 300
}
variable "bedrockagent_agent_instruction" {
  description = "(Optional) Instructions that tell the agent what it should do and how it should interact with users"
  type        = string 
  default     = null
}
variable "bedrockagent_agent_prepare_agent" {
  description = "(Optional) Whether to prepare the agent after creation or modification. Defaults to true"
  type        = bool
  default     = true
}
variable "bedrockagent_agent_skip_resource_in_use_check" {
  description = "(Optional) Whether the in-use check is skipped when deleting the agent"
  type        = bool
  default     = true
}
variable "bedrockagent_agent_tags" {
  description = "(Optional) Map of tags assigned to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "bedrockagent_agent_guardrail_configuration" {
  description = "(Optional) Details about the guardrail associated with the agent"
  type        = list(object({
    guardrail_identifier = optional(string)
    guardrail_version    = optional(string)
  }))
  default     = []
}
variable "bedrockagent_agent_memory_configuration" {
  description = "(Optional) Configurations for the agent's ability to retain the conversational context"
  type        = list(object({
    session_summary_configuration = optional(list(object({
      max_recent_sessions = optional(number)
    })), [])
  }))
  default     = []
}
variable "bedrockagent_agent_prompt_override_configuration" {
  description = "(Optional) Configurations to override prompt templates in different parts of an agent sequence"
  type        = list(object({
    override_lambda       = optional(string)
    prompt_configurations = list(object({
      base_prompt_template    = string
      parser_mode             = string
      prompt_creation_mode    = string
      prompt_state            = string
      prompt_type             = string
      inference_configuration = list(object({
        max_length     = number
        stop_sequences = list(string)
        temperature    = number
        top_k          = number
        top_p          = number
      })) 
    })) 
  }))
  default     = []
}
