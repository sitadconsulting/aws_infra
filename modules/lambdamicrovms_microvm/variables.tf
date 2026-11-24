variable "lambdamicrovms_microvm_image_arn" {
  description = "(Required) ARN of the MicroVM image to run. Changing this value creates a new resource"
  type        = string
}
variable "lambdamicrovms_microvm_egress_network_connectors" {
  description = "(Optional) List of egress network connector ARNs for outbound connectivity. Changing this value creates a new resource"
  type        = list(string)
  default     = null
}
variable "lambdamicrovms_microvm_execution_role_arn" {
  description = "(Optional) ARN of the IAM role assumed by the MicroVM during execution. Changing this value creates a new resource"
  type        = string
  default     = null
}
variable "lambdamicrovms_microvm_image_version" {
  description = "(Optional) Version of the MicroVM image to run. Defaults to the latest active version. Changing this value creates a new resource"
  type        = string
  default     = null
}
variable "lambdamicrovms_microvm_ingress_network_connectors" {
  description = "Optional) List of ingress network connector ARNs for inbound connectivity. Changing this value creates a new resource"
  type        = list(string)
  default     = null
}
variable "lambdamicrovms_microvm_maximum_duration_in_seconds" {
  description = "(Optional) Maximum duration in seconds that the MicroVM can exist before the platform terminates it. Valid range: 1–28800 (8 hours). Changing this value creates a new resource"
  type        = number
  default     = null
}
variable "lambdamicrovms_microvm_run_hook_payload" {
  description = "(Optional) String payload (maximum 16 KB) delivered to the /run lifecycle hook when the MicroVM starts. Changing this value creates a new resource"
  type        = string
  default     = null
}
variable "lambdamicrovms_microvm_idle_policy" {
  description = "(Optional) Configuration controlling automatic suspend and resume behavior. Changing this value creates a new resource"
  type        = list(object({
    auto_resume_enabled        = bool
    max_idle_duration_seconds  = number
    suspended_duration_seconds = number
  }))
  default     = []
}
variable "lambdamicrovms_microvm_logging" {
  description = "(Optional) Logging configuration for the MicroVM. Changing this value creates a new resource "
  type        = list(object({
    cloudwatch = optional(list(object({
      log_group  = optional(string)
      log_stream = optional(string)
    })), [])
    disabled   = optional(list(object({
    })), [])
  }))
  default     = []
}
