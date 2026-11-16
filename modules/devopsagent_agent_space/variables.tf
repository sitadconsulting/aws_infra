variable "devopsagent_agent_space_description" {
  description = "(Optional) Description of the Agent Space"
  type        = string
  default     = null
}
variable "devopsagent_agent_space_kms_key_arn" {
  description = "(Optional) ARN of the AWS KMS key used to encrypt resources. Forces new resource"
  type        = string
  default     = null
}
variable "devopsagent_agent_space_locale" {
  description = "(Optional) Locale for the Agent Space, which determines the language used in agent responses (e.g., en)"
  type        = string 
  default     = null
}
variable "devopsagent_agent_space_name" {
  description = "(Required) Name of the Agent Space"
  type        = string
}
variable "devopsagent_agent_space_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
