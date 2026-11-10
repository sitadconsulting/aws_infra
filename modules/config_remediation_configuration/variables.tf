variable "config_remediation_configuration_automatic" {
  description = "(Optional) Remediation is triggered automatically if true"
  type        = bool
  default     = null
}
variable "config_remediation_configuration_config_rule_name" {
  description = "(Required) Name of the AWS Config rule"
  type        = string
}
variable "config_remediation_configuration_maximum_automatic_attempts" {
  description = "(Optional) Maximum number of failed attempts for auto-remediation. If you do not select a number, the default is 5"
  type        = number
  default     = null
}
variable "config_remediation_configuration_resource_type" {
  description = "(Optional) Type of resource"
  type        = string
  default     = null
}
variable "config_remediation_configuration_retry_attempt_seconds" {
  description = "(Optional) Maximum time in seconds that AWS Config runs auto-remediation. If you do not select a number, the default is 60 seconds"
  type        = number
  default     = null
}
variable "config_remediation_configuration_target_id" {
  description = "(Required) Target ID is the name of the public document"
  type        = string
}
variable "config_remediation_configuration_target_type" {
  description = "(Required) Type of the target. Target executes remediation. For example, SSM document"
  type        = string
}
variable "config_remediation_configuration_target_version" {
  description = " (Optional) Version of the target. For example, version of the SSM document"
  type        = string
  default     = null
}
variable "config_remediation_configuration_execution_controls" {
  description = "(Optional) Configuration block for execution controls"
  type        = list(object({
    ssm_controls = list(object({
      concurrent_execution_rate_percentage = optional(number)
      error_percentage                     = optional(number)
    }))
  }))
  default     = []
}
variable "config_remediation_configuration_parameter" {
  description = "(Optional) Can be specified multiple times for each parameter"
  type        = list(object({
    name           = string
    resource_value = optional(string)
    static_value   = optional(string)
    static_values  = optional(list(string))
  }))
  default     = []
}
