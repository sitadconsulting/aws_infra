variable "guardduty_filter_action" {
  description = "(Required) Action that is to be applied to the findings that match the filter. Can be one of ARCHIVE or NOOP"
  type        = string
}
variable "guardduty_filter_description" {
  description = "(Optional) Description of the filter"
  type        = string
  default     = null
}
variable "guardduty_filter_detector_id" {
  description = "(Required) ID of a GuardDuty detector, attached to your account"
  type        = string
}
variable "guardduty_filter_name" {
  description = "(Required) Name of your filter"
  type        = string
}
variable "guardduty_filter_rank" {
  description = "(Required) Position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings"
  type        = number
}
variable "guardduty_filter_tags" {
  description = "(Optional) Tags that you want to add to the Filter resource"
  type        = map(string)
  default     = {}
}
variable "guardduty_filter_finding_criteria" {
  description = "(Required) Criteria to be used in the filter for querying findings. Contains one or more criterion blocks"
  type        = list(object({
    equals                = optional(list(string))
    field                 = string
    greater_than          = optional(string)
    greater_than_or_equal = optional(string)
    less_than             = optional(string)
    less_than_or_equal    = optional(string)
    matches               = optional(list(string))
    not_equals            = optional(list(string))
    not_matches           = optional(list(string))
  }))
}
