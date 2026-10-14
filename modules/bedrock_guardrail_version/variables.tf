variable "bedrock_guardrail_version_description" {
  description = "(Optional) Description of the Guardrail version" 
  type        = string
  default     = null
}
variable "bedrock_guardrail_version_guardrail_arn" {
  description = "(Required) Guardrail ARN" 
  type        = string
}
variable "bedrock_guardrail_version_skip_destroy" {
  description = "(Optional) Whether to retain the old version of a previously deployed Guardrail. Default is false" 
  type        = bool
  default     = false
}
