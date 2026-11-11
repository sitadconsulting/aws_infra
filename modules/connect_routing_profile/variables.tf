variable "connect_routing_profile_default_outbound_queue_id" {
  description = "(Required) Specifies the default outbound queue for the Routing Profile"
  type        = string
}  
variable "connect_routing_profile_description" {
  description = "(Required) Specifies the description of the Routing Profile"
  type        = string
}
variable "connect_routing_profile_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_routing_profile_name" {
  description = "(Required) Specifies the name of the Routing Profile"
  type        = string
}
variable "connect_routing_profile_tags" {
  description = "(Optional) Tags to apply to the Routing Profile"
  type        = map(string)
  default     = {}
}
variable "connect_routing_profile_media_concurrencies" {
  description = "(Required) One or more media_concurrencies blocks that specify the channels that agents can handle in the Contact Control Panel (CCP) for this Routing Profile"
  type        = list(object({
    channel                = string
    concurrency            = number
    cross_channel_behavior = optional(list(object({
      behavior_type = string
    })), [])
  }))
}
variable "connect_routing_profile_queue_configs" {
  description = "(Optional) One or more queue_configs blocks that specify the inbound queues associated with the routing profile. If no queue is added, the agent only can make outbound calls"
  type        = list(object({
    channel  = string
    delay    = number
    priority = number
    queue_id = string
  }))
  default     = []
}
