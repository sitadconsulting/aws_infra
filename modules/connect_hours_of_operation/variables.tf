variable "connect_hours_of_operation_description" {
  description = "(Optional) Specifies the description of the Hours of Operation"
  type        = string
  default     = null
}
variable "connect_hours_of_operation_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_hours_of_operation_name" {
  description = "(Required) Specifies the name of the Hours of Operation"
  type        = string
}
variable "connect_hours_of_operation_tags" {
  description = "(Optional) Tags to apply to the Hours of Operation"
  type        = map(string)
  default     = {}
}
variable "connect_hours_of_operation_time_zone" {
  description = "(Required) Specifies the time zone of the Hours of Operation"
  type        = string
}
variable "connect_hours_of_operation_config" {
  description = "(Required) One or more config blocks which define the configuration information for the hours of operation: day, start time, and end time"
  type        = list(object({
    day        = string
    end_time   = list(object({
      hours   = number
      minutes = number
    }))
    start_time = list(object({
      hours   = number
      minutes = number
    }))
  }))
}
