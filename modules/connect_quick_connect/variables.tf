variable "connect_quick_connect_description" {
  description = "(Optional) Specifies the description of the Quick Connect"
  type        = string
  default     = null
}
variable "connect_quick_connect_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_quick_connect_name" {
  description = "(Required) Specifies the name of the Quick Connect"
  type        = string
}
variable "connect_quick_connect_tags" {
  description = "(Optional) Tags to apply to the Quick Connect"
  type        = map(string)
  default     = {}
}
variable "connect_quick_connect_quick_connect_config" {
  description = "(Required) A block that defines the configuration information for the Quick Connect: quick_connect_type and one of phone_config, queue_config, user_config "
  type        = list(object({
    quick_connect_type = string
    phone_config       = optional(list(object({
      phone_number = string
    })), [])
    queue_config       = optional(list(object({
      contact_flow_id = string
      queue_id        = string
    })), []) 
    user_config        = optional(list(object({ 
      contact_flow_id = string
      user_id         = string
    })), [])
  }))
}
