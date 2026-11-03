variable "cloudwatchomni_space_data_access_role_arn" {
  description = "(Required) ARN of the IAM role CloudWatch Omni assumes to access data. Must be in the same account as the space. Changing this forces a new resource"
  type        = string
}
variable "cloudwatchomni_space_domain_id" {
  description = "(Required) ID of the CloudWatch Omni domain the space belongs to. Changing this forces a new resource"
  type        = string
}
variable "cloudwatchomni_space_name" {
  description = "(Required) Name of the space. Must be 3-64 characters of lowercase letters, numbers and hyphens, must begin and end with a letter or number, and cannot contain consecutive hyphens"
  type        = string
}
variable "cloudwatchomni_space_agent_core_evaluation_role_arn" {
  description = "(Optional) ARN of the IAM role used by AgentCore online evaluation. Changing this forces a new resource"
  type        = string
  default     = null
}
variable "cloudwatchomni_space_encryption_configuration" {
  description = "(Optional) Encryption of the space's data at rest. Omit for AWS owned encryption"
  type        = list(object({
    encryption_configuration = optional(list(object({
      encryption_strategy = string
      kms_key_arn         = optional(string)
    })), [])
  }))
  default     = []
}
