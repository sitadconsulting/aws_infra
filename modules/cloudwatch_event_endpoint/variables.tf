variable "cloudwatch_event_endpoint_description" {
  description = "(Optional) A description of the global endpoint"
  type        = string
  default     = null
}
variable "cloudwatch_event_endpoint_name" {
  description = "(Required) The name of the global endpoint"
  type        = string
}
variable "cloudwatch_event_endpoint_role_arn" {
  description = "(Optional) The ARN of the IAM role used for replication between event buses"
  type        = string
  default     = null
}
variable "cloudwatch_event_endpoint_event_bus" {
  description = "(Required) The event buses to use. The names of the event buses must be identical in each Region. Exactly two event buses are required"
  type        = list(object({
    event_bus_arn = string
  }))
}
variable "cloudwatch_event_endpoint_replication_config" {
  description = "(Optional) Parameters used for replication"
  type        = list(object({
    state = optional(string)
  }))
  default     = []
}
variable "cloudwatch_event_endpoint_routing_config" {
  description = "(Required) Parameters used for routing, including the health check and secondary Region"
  type        = list(object({
    failover_config = list(object({
      primary   = list(object({
        health_check = string
      }))
      secondary = list(object({
        route = string
      }))
    }))
  }))
}
