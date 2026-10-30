variable "ce_cost_category_default_value" {
  description = "(Optional) Default value for the cost category"
  type        = string
  default     = null
}
variable "ce_cost_category_effective_start" {
  description = "(Optional) The Cost Category's effective start date. It can only be a billing start date (first day of the month). If the date isn't provided, it's the first day of the current month. Dates can't be before the previous twelve months, or in the future. For example 2022-11-01T00:00:00Z"
  type        = string
  default     = null
}
variable "ce_cost_category_name" {
  description = "(Required) Unique name for the Cost Category"
  type        = string
}
variable "ce_cost_category_rule_version" {
  description = "(Required) Rule schema version in this particular Cost Category"
  type        = string
}
variable "ce_cost_category_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "ce_cost_category_rule" {
  description = "(Required) Configuration block for the Cost Category rules used to categorize costs"
  type        = list(object({
    type            = optional(string)
    value           = optional(string)
    inherited_value = list(object({
      dimension_key  = optional(string)
      dimension_name = optional(string)
    }))
    rule            = optional(list(object({
      and           = optional(string)
      not           = optional(string)
      or            = optional(string)
      cost_category = optional(list(object({
        key           = optional(string)
        match_options = optional(string)
        values        = optional(string)
      })), [])
      dimension     = optional(list(object({
        key           = optional(string)
        match_options = optional(string)
        values        = optional(string)
      })), [])
      tags          = optional(list(object({
        key           = optional(string)
        match_options = optional(string)
        values        = optional(string)
      })), [])
    })), [])
  }))
}
variable "ce_cost_category_split_charge_rule" {
  description = "(Optional) Configuration block for the split charge rules used to allocate your charges between your Cost Category values"
  type        = list(object({
    method    = string
    source    = string
    targets   = string
    parameter = optional(list(object({
      type   = optional(string)
      values = optional(list(string))
    })), [])
  }))
  default     = []
}
