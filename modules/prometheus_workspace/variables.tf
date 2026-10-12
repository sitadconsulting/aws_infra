variable "prometheus_workspace_alias" {
  description = "(Optional) The alias of the prometheus workspace"
  type        = string
  default     = null
}
variable "prometheus_workspace_kms_key_arn" {
  description = " (Optional) The ARN for the KMS encryption key. If this argument is not provided, then the AWS owned encryption key will be used to encrypt the data in the workspace"
  type        = string
  default     = null
}
variable "prometheus_workspace_tags" {
  description = "Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = null
}
variable "prometheus_workspace_logging_configuration" {
  description = "Optional) Logging configuration for the workspace"
  type        = list(object({
    log_group_arn = string
  }))
  default     = []
}
