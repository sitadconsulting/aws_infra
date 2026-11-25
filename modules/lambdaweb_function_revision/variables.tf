variable "lambdaweb_function_revision_description" {
  description = "(Optional) Description of the revision"
  type        = string
  default     = null
}
variable "lambdaweb_function_revision_function_name" {
  description = "(Required) Web function name"
  type        = string 
}
variable "lambdaweb_function_revision_kms_key_arn" {
  description = "(Optional) ARN of the KMS key used to encrypt the revision's code and environment variables"
  type        = string
  default     = null
}
variable "lambdaweb_function_revision_build_config" {
  description = "(Required) Build configuration for the revision"
  type        = list(object({
    code_config    = list(object({
      s3_object  = list(object({
        bucket     = string
        key        = string 
        version_id = optional(string)
      }))
    }))
    runtime_config = list(object({
      runtime = string
    }))
  }))
}
variable "lambdaweb_function_revision_service_config" {
  description = "(Required) Service configuration for the revision"
  type        = list(object({
    egress_network_connector_arn    = optional(string)
    environment_variables           = optional(map(string))
    execution_role_arn              = string
    max_concurrency_per_environment = optional(number)
    timeout_seconds                 = optional(number)
    telemetry_config                = optional(list(object({
      logging_config = optional(list(object({
        application_log_level = optional(string)
        log_group             = optional(string)
        system_log_level      = optional(string)
      })), [])
    })), [])
  }))
}
