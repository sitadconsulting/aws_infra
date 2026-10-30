variable "cloudwatch_alarm_mute_rule_description" {
  description = "(Optional) Description of the alarm mute rule"
  type        = string
  default     = null
}
variable "cloudwatch_alarm_mute_rule_expire_date" {
  description = "(Optional) Date and time in RFC3339 format when the mute rule expires. Seconds must be set to 00 (e.g., 2026-12-31T23:59:00Z). Must not be set when using at() expressions"
  type        = string
  default     = null
}
variable "cloudwatch_alarm_mute_rule_name" {
  description = "(Required) Name of the alarm mute rule. Changing this forces a new"
  type        = string
}
variable "cloudwatch_alarm_mute_rule_start_date" {
  description = "(Optional) Date and time in RFC3339 format when the mute rule becomes active. Seconds must be set to 00 (e.g., 2026-01-01T00:00:00Z). Must not be set when using at() expressions"
  type        = string
  default     = null
}
variable "cloudwatch_alarm_mute_rule_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_alarm_mute_rule_rule" {
  description = "(Required) Rule definition for the mute rule"
  type        = list(object({
    schedule = list(object({
      duration   = string
      expression = string
      timezone   = optional(string)
    }))
  }))
}
variable "cloudwatch_alarm_mute_rule_mute_targets" {
  description = "(Optional) Alarms to mute"
  type        = list(object({
    alarm_names = list(string)
  }))
  default     = []
}
