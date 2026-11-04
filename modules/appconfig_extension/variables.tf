variable "appconfig_extension_description" {
  description = "(Optional) Information about the extension"
  type        = string
  default     = null
}
variable "appconfig_extension_name" {
  description = "(Required) Name for the extension. Each extension name in your account must be unique. Extension versions use the same name"
  type        = string
}
variable "appconfig_extension_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appconfig_extension_action_point" {
  description = "(Required) Action points defined in the extension"
  type        = list(object({
    point  = string
    action = list(object({
      description = optional(string)
      name        = string
      role_arn    = optional(string)
      uri         = string
    }))
  }))
}
variable "appconfig_extension_parameter" {
  description = "(Optional) Parameters accepted by the extension. You specify parameter values when you associate the extension to an AppConfig resource by using the CreateExtensionAssociation API action. For Lambda extension actions, these parameters are included in the Lambda request object"
  type        = list(object({
    description = optional(string)
    name        = string
    required    = optional(bool)
  }))
  default     = []
}
