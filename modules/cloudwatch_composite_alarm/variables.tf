variable "cloudwatch_composite_alarm_actions_enabled" {
  description = "(Optional, Forces new resource) Indicates whether actions should be executed during any changes to the alarm state of the composite alarm. Defaults to true"
  type        = bool
  default     = true
}
variable "cloudwatch_composite_alarm_alarm_actions" {
  description = "(Optional) The set of actions to execute when this alarm transitions to the ALARM state from any other state. Each action is specified as an ARN. Up to 5 actions are allowed"
  type        = list(string)
  default     = null
}
variable "cloudwatch_composite_alarm_alarm_description" {
  description = "(Optional) The description for the composite alarm"
  type        = string
  default     = null
}
variable "cloudwatch_composite_alarm_alarm_name" {
  description = "(Required) The name for the composite alarm. This name must be unique within the region"
  type        = string
}
variable "cloudwatch_composite_alarm_alarm_rule" {
  description = "(Required) Expression that specifies which other alarms are to be evaluated to determine this composite alarm's state. For syntax, see Creating a Composite Alarm. The maximum length is 10240 characters. Leading and trailing whitespace are not allowed"
  type        = string
}
variable "cloudwatch_composite_alarm_insufficient_data_actions" {
  description = "(Optional) The set of actions to execute when this alarm transitions to the INSUFFICIENT_DATA state from any other state. Each action is specified as an ARN. Up to 5 actions are allowed"
  type        = list(string)
  default     = null
}
variable "cloudwatch_composite_alarm_ok_actions" {
  description = "(Optional) The set of actions to execute when this alarm transitions to an OK state from any other state. Each action is specified as an ARN. Up to 5 actions are allowed"
  type        = list(string)
  default     = null
}
variable "cloudwatch_composite_alarm_tags" {
  description = "(Optional) A map of tags to associate with the alarm"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_composite_alarm_actions_suppressor" {
  description = "(Optional) Actions will be suppressed if the suppressor alarm is in the ALARM state"
  type        = list(object({
    alarm            = string
    extension_period = number
    wait_period      = number
  }))
  default     = []
}
