variable "config_configuration_recorder_name" {
  description = "(Optional) The name of the configuration recorder. Defaults to default. Changing it recreates the resource"
  type        = string
  default     = null
}
variable "config_configuration_recorder_role_arn" {
  description = "(Required) ARN of the IAM role. Used to make read or write requests to the delivery channel and to describe the AWS resources associated with the account "
  type        = string
}
variable "config_configuration_recorder_recording_group" {
  description = "(Optional) Recording group"
  type        = list(object({
    all_supported                 = optional(bool) 
    include_global_resource_types = optional(bool)
    resource_types                = optional(list(string))
    exclusion_by_resource_types   = optional(list(object({
      resource_types = optional(list(string))
    })), [])
    recording_strategy            = optional(list(object({
      use_only = optional(string)
    })), []) 
  }))
  default     = []
}
variable "config_configuration_recorder_recording_mode" {
  description = "(Optional) Recording mode"
  type        = list(object({
    recording_frequency     = optional(string)
    recording_mode_override = optional(list(object({
      description         = optional(string)
      recording_frequency = string
      resource_types      = list(string)
    })), [])
  }))
  default     = []
}
