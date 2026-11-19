variable "cloudwatch_event_bus_policy_policy" {
  description = "(Required) The text of the policy"
  type        = string
}
variable "cloudwatch_event_bus_policy_event_bus_name" {
  description = "(Optional) The name of the event bus to set the permissions on. If you omit this, the permissions are set on the default event bus"
  type        = string
  default     = null
}
