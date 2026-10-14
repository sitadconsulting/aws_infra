variable "bedrock_guardrail_blocked_input_messaging" {
  description = "(Required) Message to return when the guardrail blocks a prompt"
  type        = string
}
variable "bedrock_guardrail_blocked_outputs_messaging" {
  description = "(Required) Message to return when the guardrail blocks a model response"
  type        = string
}
variable "bedrock_guardrail_description" {
  description = "(Optional) Description of the guardrail or its version"
  type        = string
  default     = null
}
variable "bedrock_guardrail_name" {
  description = "(Required) Name of the guardrail"
  type        = string
}
variable "bedrock_guardrail_kms_key_arn" {
  description = "(Optional) The KMS key with which the guardrail was encrypted at rest"
  type        = string
  default     = null
}
variable "bedrock_guardrail_tags" {
  description = "(Optional) Key-value map of resource tags" 
  type        = map(string)
  default     = {}
}
variable "bedrock_guardrail_content_policy_config" {
  description = "(Optional) Content policy config for a guardrail"
  type        = list(object({
    filters_config = optional(list(object({
      input_action      = optional(string)
      input_enabled     = optional(bool)
      input_modalities  = optional(list(string))
      input_strength    = string
      output_action     = optional(string)
      output_enabled    = optional(bool)
      output_modalities = optional(list(string))
      output_strength   = string
      type              = string
    })),[])
    tier_config   = optional(list(object({
      tier_name = string
    })), [])
  }))
  default     = []
}
variable "bedrock_guardrail_contextual_grounding_policy_config" {
  description = "(Optional) Contextual grounding policy config for a guardrail"
  type        = list(object({
    filters_config = list(object({
      threshold = number
      type      = string
    }))
  }))
  default     = []
}
variable "bedrock_guardrail_cross_region_config" {
  description = "(Optional) Configuration block to enable cross-region routing for bedrock guardrails"
  type        = list(object({
    guardrail_profile_identifier = string
  }))
  default     = []
}
variable "bedrock_guardrail_sensitive_information_policy_config" {
  description = "(Optional) Sensitive information policy config for a guardrail"
  type        = list(object({
    pii_entities_config = optional(list(object({
      action         = string
      input_action   = optional(string)
      input_enabled  = optional(bool)
      output_action  = optional(string)
      output_enabled = optional(bool)
      type           = string
    })))
    regexes_config      = optional(list(object({
      action         = string
      description    = optional(string)
      input_action   = optional(string)
      input_enabled  = optional(bool)
      name           = string
      output_action  = optional(string)
      output_enabled = optional(bool)
      pattern        = string
    })))
  }))
  default     = []
}
variable "bedrock_guardrail_topic_policy_config" {
  description = "(Optional) Topic policy config for a guardrail"
  type        = list(object({
    tier_config = optional(list(object({
      tier_name = string
    })), [])
    topics_config = list(object({
      definition = string
      examples   = optional(list(string))
      name       = string
      type       = string
    }))
  }))
  default     = []
}
variable "bedrock_guardrail_word_policy_config" {
  description = "(Optional) Word policy config for a guardrail"
  type        = list(object({
    managed_word_lists_config = optional(list(object({
      input_action   = optional(string)
      input_enabled  = optional(bool)
      output_action  = optional(string)
      output_enabled = optional(bool)
      type           = string
    })))
    words_config              = optional(list(object({
      input_action   = optional(string)
      input_enabled  = optional(bool)
      output_action  = optional(string)
      output_enabled = optional(bool)
      text           = string
    })))
  }))
  default     = []
}
