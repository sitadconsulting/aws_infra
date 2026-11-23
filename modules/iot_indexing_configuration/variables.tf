variable "iot_indexing_configuration_thing_group_indexing_configuration" {
  description = "(Optional) Thing group indexing configuration"
  type        = list(object({
    thing_group_indexing_mode = string
    custom_field  = optional(list(object({
      name = optional(string)
      type = optional(string)
    })), [])
    managed_field = optional(list(object({
      name = optional(string)
      type = optional(string)
    })), [])
  }))
  default     = []
}
variable "iot_indexing_configuration_thing_indexing_configuration" {
  description = "(Optional) Thing indexing configuration"
  type        = list(object({
    device_defender_indexing_mode    = optional(string)
    named_shadow_indexing_mode       = optional(string)
    thing_connectivity_indexing_mode = optional(string)
    thing_indexing_mode              = string
    custom_field  = optional(list(object({
      name = optional(string)
      type = optional(string)
    })), [])
    managed_field = optional(list(object({
      name = optional(string)
      type = optional(string)
    })), [])
    filter         = optional(list(object({
      named_shadow_names = optional(list(string))
    })), [])
  }))
  default     = []
}
