variable "iot_thing_attributes" {
  description = "(Optional) Map of attributes of the thing"
  type        = map(string)
  default     = {}
}
variable "iot_thing_name" {
  description = "(Required) The name of the thing"
  type        = string
}
variable "iot_thing_thing_type_name" {
  description = "(Optional) The thing type name"
  type        = string
  default     = null
}
