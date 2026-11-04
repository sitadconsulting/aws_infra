variable "appconfig_application_description" {
  description = "(Optional) Description of the application. Can be at most 1024 characters"
  type        = string
  default     = null
}
variable "appconfig_application_name" {
  description = "(Required) Name for the application. Must be between 1 and 64 characters in length"
  type        = string
}
variable "appconfig_application_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
