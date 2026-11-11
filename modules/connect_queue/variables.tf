variable "connect_queue_description" {
  description = "(Optional) Specifies the description of the Queue"
  type        = string
  default     = null
}
variable "connect_queue_hours_of_operation_id" {
  description = "(Required) Specifies the identifier of the Hours of Operation"
  type        = string
}
variable "connect_queue_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_queue_max_contacts" {
  description = "(Optional) Specifies the maximum number of contacts that can be in the queue before it is considered full. Minimum value of 0"
  type        = number
  default     = null
}
variable "connect_queue_name" {
  description = "(Required) Specifies the name of the Queue"
  type        = string
}
variable "connect_queue_quick_connect_ids" {
  description = "(Optional) Specifies a list of quick connects IDs that determine the quick connects available to agents who are working the queue"
  type        = list(string)
  default     = null
}
variable "connect_queue_status" {
  description = "(Optional) Specifies the description of the Queue. Valid values are ENABLED, DISABLED"
  type        = string
  default     = null
}
variable "connect_queue_tags" {
  description = "(Optional) Tags to apply to the Queue"
  type        = map(string)
  default     = {}
}
variable "connect_queue_outbound_caller_config" {
  description = "(Required) A block that defines the outbound caller ID name, number, and outbound whisper flow"
  type        = list(object({
    outbound_caller_id_name      = optional(string)
    outbound_caller_id_number_id = optional(string)
    outbound_flow_id             = optional(string)
  }))
}
