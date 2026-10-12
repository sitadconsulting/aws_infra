variable "prometheus_rule_group_namespace_data" {
  description = "(Required) the rule group namespace data that you want to be applied"
  type        = string
}
variable "prometheus_rule_group_namespace_name" {
  description = "(Required) The name of the rule group namespace"
  type        = string
}
variable "prometheus_rule_group_namespace_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = null
}
variable "prometheus_rule_group_namespace_workspace_id" {
  description = "(Required) ID of the prometheus workspace the rule group namespace should be linked to"
  type        = string
}
