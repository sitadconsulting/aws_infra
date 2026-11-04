variable "appconfig_environment_application_id" {
  description = "(Required, Forces new resource) AppConfig application ID. Must be between 4 and 7 characters in length"
  type        = string
}
variable "appconfig_environment_description" {
  description = "(Optional) Description of the environment. Can be at most 1024 characters"
  type        = string
  default     = null
}
variable "appconfig_environment_name" {
  description = "(Required) Name for the environment. Must be between 1 and 64 characters in length"
  type        = string
}
variable "appconfig_environment_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appconfig_environment_monitor" {
  description = "(Optional) Set of Amazon CloudWatch alarms to monitor during the deployment process. Maximum of 5"
  type        = list(object({
    alarm_arn      = string
    alarm_role_arn = optional(string)
  }))
  default     = []
}
