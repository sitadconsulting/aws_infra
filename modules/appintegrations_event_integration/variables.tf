variable "appintegrations_event_integration_description" {
  description = "(Optional) Description of the Event Integration"
  type        = string
  default     = null
}
variable "appintegrations_event_integration_eventbridge_bus" {
  description = "(Required) EventBridge bus"
  type        = string
}
variable "appintegrations_event_integration_name" {
  description = "(Required) Name of the Event Integration"
  type        = string
}
variable "appintegrations_event_integration_tags" {
  description = "(Optional) Tags to apply to the Event Integration"
  type        = map(string)
  default     = {}
}
variable "appintegrations_event_integration_event_filter" {
  description = "(Required) Block that defines the configuration information for the event filter"
  type        = list(object({
    source = string
  }))
}
