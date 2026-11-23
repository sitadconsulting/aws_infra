variable "iot_role_alias_alias" {
  description = "(Required) The name of the role alias"
  type        = string
}
variable "iot_role_alias_credential_duration" {
  description = "(Optional) The duration of the credential, in seconds. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 900 seconds (15 minutes) to 43200 seconds (12 hours)."
  type        = number
  default     = null
}
variable "iot_role_alias_role_arn" {
  description = "(Required) The identity of the role to which the alias refers"
  type        = string
}
variable "iot_role_alias_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
