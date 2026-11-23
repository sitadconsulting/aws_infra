variable "iot_thing_group_name" {
  description = "(Required) The name of the Thing Group"
  type        = string
}
variable "iot_thing_group_parent_group_name" {
  description = "(Optional) The name of the parent Thing Group"
  type        = string
  default     = null
}
variable "iot_thing_group_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "iot_thing_group_properties" {
  description = "(Optional) The Thing Group properties"
  type        = list(object({
    description       = optional(string)
    attribute_payload = optional(list(object({
      attributes = optional(map(string)) 
    })), [])
  }))
  default     = []
}
