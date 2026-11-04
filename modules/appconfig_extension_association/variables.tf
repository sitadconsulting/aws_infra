variable "appconfig_extension_association_extension_arn" {
  description = "(Required) ARN of the extension defined in the association"
  type        = string
}
variable "appconfig_extension_association_parameters" {
  description = "(Optional) Parameter names and values defined for the association"
  type        = map(string)
  default     = {}
}
variable "appconfig_extension_association_resource_arn" {
  description = "Required) ARN of the application, configuration profile, or environment to associate with the extension"
  type        = string
}
