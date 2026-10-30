variable "cloudwatch_contributor_managed_insight_rule_resource_arn" {
  description = "(Required) ARN of an Amazon Web Services resource that has managed Contributor Insights rules"
  type        = string
}
variable "cloudwatch_contributor_managed_insight_rule_rule_state" {
  description = "(Optional) State of the rule. Valid values are ENABLED and DISABLED."
  type        = string
  default     = null
}
variable "cloudwatch_contributor_managed_insight_rule_template_name" {
  description = "(Required) Template name for the managed Contributor Insights rule, as returned by ListManagedInsightRules"
  type        = string
}
