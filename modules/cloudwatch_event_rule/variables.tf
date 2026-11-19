variable "cloudwatch_event_rule_description" {
  description = "(Optional) The description of the rule"
  type        = string
  default     = null
}
variable "cloudwatch_event_rule_event_bus_name" {
  description = "(Optional) The name or ARN of the event bus to associate with this rule. If you omit this, the default event bus is used"
  type        = string
  default     = null
}
variable "cloudwatch_event_rule_event_pattern" {
  description = "(Optional) The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details. Note: The event pattern size is 2048 by default but it is adjustable up to 4096 characters by submitting a service quota increase request"
  type        = string
  default     = null
}
variable "cloudwatch_event_rule_force_destroy" {
  description = "(Optional) Used to delete managed rules created by AWS. Defaults to false"
  type        = bool
  default     = false
}
variable "cloudwatch_event_rule_is_enabled" {
  description = "(Optional, Deprecated Use state instead) Whether the rule should be enabled. Defaults to true. Conflicts with state"
  type        = bool
  default     = null
}
variable "cloudwatch_event_rule_name" {
  description = "(Optional) The name of the rule. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "cloudwatch_event_rule_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name. Note: Due to the length of the generated suffix, must be 38 characters or less"
  type        = string
  default     = null
}
variable "cloudwatch_event_rule_role_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) associated with the role that is used for target invocation"
  type        = string
  default     = null
}
variable "cloudwatch_event_rule_schedule_expression" {
  description = "(Optional) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required. Can only be used on the default event bus"
  type        = string
  default     = null
}
variable "cloudwatch_event_rule_state" {
  description = "(Optional) State of the rule. Valid values are DISABLED, ENABLED, and ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS. When state is ENABLED, the rule is enabled for all events except those delivered by CloudTrail. To also enable the rule for events delivered by CloudTrail, set state to ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS. Defaults to ENABLED. Conflicts with is_enabled"
  type        = string
  default     = "ENABLED"
}
variable "cloudwatch_event_rule_tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
