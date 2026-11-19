variable "cloudwatch_event_permission_action" {
  description = "(Optional) The action that you are enabling the other account to perform. Defaults to events:PutEvents"
  type        = string
  default     = null
}
variable "cloudwatch_event_permission_event_bus_name" {
  description = "(Optional) The name of the event bus to set the permissions on. If you omit this, the permissions are set on the default event bus"
  type        = string
  default     = null
}
variable "cloudwatch_event_permission_principal" {
  description = "(Required) The 12-digit AWS account ID that you are permitting to put events to your default event bus. Specify * to permit any account to put events to your default event bus, optionally limited by condition"
  type        = string
}
variable "cloudwatch_event_permission_statement_id" {
  description = "(Required) An identifier string for the external account that you are granting permissions to"
  type        = string
}
variable "cloudwatch_event_permission_condition" {
  description = "(Optional) Configuration block to limit the event bus permissions you are granting to only accounts that fulfill the condition"
  type        = list(object({
    key   = string
    type  = string
    value = string
  }))
  default     = []
}
