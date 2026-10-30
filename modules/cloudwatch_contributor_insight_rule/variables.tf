variable "cloudwatch_contributor_insight_rule_rule_definition" {
  description = "(Required) Definition of the rule, as a JSON object"
  type        = string
}
variable "cloudwatch_contributor_insight_rule_rule_name" {
  description = "(Required) Unique name of the rule"
  type        = string
}
variable "cloudwatch_contributor_insight_rule_rule_state" {
  description = "(Optional) State of the rule. Valid values are ENABLED and DISABLED"
  type        = string
  default     = null
}
