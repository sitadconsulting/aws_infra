variable "config_config_rule_description" {
  description = "(Optional) Description of the rule"
  type        = string
  default     = null
}
variable "config_config_rule_input_parameters" {
  description = "(Optional) A string in JSON format that is passed to the AWS Config rule Lambda function"
  type        = string
  default     = null
}
variable "config_config_rule_maximum_execution_frequency" {
  description = "(Optional) The maximum frequency with which AWS Config runs evaluations for a rule"
  type        = string
  default     = null
}
variable "config_config_rule_name" {
  description = "(Required) The name of the rule"
  type        = string
}
variable "config_config_rule_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "config_config_rule_evaluation_mode" {
  description = "(Optional) The modes the Config rule can be evaluated in"
  type        = list(object({
    mode = optional(string) 
  }))
  default     = []
}
variable "config_config_rule_scope" {
  description = "(Optional) Scope defines which resources can trigger an evaluation for the rule"
  type        = list(object({
    compliance_resource_id    = optional(string)
    compliance_resource_types = optional(list(string))
    tag_key                   = optional(string)
    tag_value                 = optional(string)
  }))
  default     = []
}
variable "config_config_rule_source" {
  description = "(Required) Source specifies the rule owner, the rule identifier, and the notifications that cause the function to evaluate your AWS resources"
  type        = list(object({
    owner                 = string
    source_identifier     = optional(string)
    custom_policy_details = optional(list(object({
      enable_debug_log_delivery = optional(bool)
      policy_runtime            = string
      policy_text               = string
    })), [])
    source_detail         = optional(list(object({
      event_source                = optional(string)
      maximum_execution_frequency = optional(string)
      message_type                = optional(string)
    })), [])
  }))
}
