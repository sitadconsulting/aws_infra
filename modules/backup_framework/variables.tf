variable "backup_framework_description" {
  description = "(Optional) Description of the framework with a maximum of 1,024 characters"
  type        = string
  default     = null
}
variable "backup_framework_name" {
  description = "(Required) Unique name of the framework. The name must be between 1 and 256 characters, starting with a letter, and consisting of letters, numbers, and underscores"
  type        = string
}
variable "backup_framework_tags" {
  description = "(Optional) Metadata that you can assign to help organize the frameworks you create"
  type        = map(string)
  default     = {}
}
variable "backup_framework_control" {
  description = "(Required) One or more control blocks that make up the framework. Each control in the list has a name, input parameters, and scope"
  type        = list(object({
    name            = string
    input_parameter = optional(list(object({
      name  = optional(string)
      value = optional(string)
    })), [])
    scope           = optional(list(object({
      compliance_resource_ids   = optional(list(string))
      compliance_resource_types = optional(list(string))
      tags                      = optional(map(string))
    })), [])
  }))
  default     = []
}
