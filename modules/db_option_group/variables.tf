variable "db_option_group_name" {
  description = "The name of the option group. If omitted, Terraform will assign a random, unique name. Must be lowercase, to match as it is stored in AWS"
  type        = string
  default     = ""
}
variable "db_option_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name. Must be lowercase, to match as it is stored in AWS"
  type        = string
  default     = ""
}
variable "db_option_group_option_group_description" {
  description = "The description of the option group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = ""
}
variable "db_option_group_engine_name" {
  description = "Specifies the name of the engine that this option group should be associated with"
  type        = string
}
variable "db_option_group_major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
}
variable "db_option_group_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "db_option_group_option" {
  description = "A list of Options to apply and settings to apply"
  type        = list(object({
    option_name                    = string
    port                           = optional(number)
    db_security_group_memberships  = optional(list(string))
    vpc_security_group_memberships = optional(list(string))
    version                        = optional(string)
    option_settings                = optional(list(object({
      name  = string
      value = string
    })))
  }))
  default  = []
}
