variable "iot_thing_type_deprecated" {
  description = "(Optional, Defaults to false) Whether the thing type is deprecated. If true, no new things could be associated with this type"
  type        = bool
  default     = false
}
variable "iot_thing_type_name" {
  description = "(Required, Forces New Resource) The name of the thing type"
  type        = string
}
variable "iot_thing_type_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "iot_thing_type_properties" {
  description = "(Optional), Configuration block that can contain the following properties of the thing type"
  type        = list(object({
    description           = optional(string)
    searchable_attributes = optional(list(string))
  }))
  default     = []
}
