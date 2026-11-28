variable "macie2_findings_filter_action" {
  description = "(Required) Action to perform on findings that meet the filter criteria (finding_criteria). Valid values are ARCHIVE, to suppress (automatically archive) the findings, and NOOP, to not perform any action on the findings"
  type        = string
}
variable "macie2_findings_filter_description" {
  description = "(Optional) Custom description of the filter. Can contain as many as 512 characters"
  type        = string
  default     = null
}
variable "macie2_findings_filter_name" {
  description = "(Optional) Custom name for the filter. Must contain at least 3 characters and can contain as many as 64 characters. If omitted, Terraform assigns a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "macie2_findings_filter_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "macie2_findings_filter_position" {
  description = "(Optional) Position of the filter in the list of saved filters on the Amazon Macie console. This value also determines the order in which the filter is applied to findings, relative to other filters that are also applied to the findings. "
  type        = number
  default     = null
}
variable "macie2_findings_filter_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "macie2_findings_filter_finding_criteria" {
  description = "(Required) Criteria to use to filter findings"
  type        = list(object({
    criterion = optional(list(object({
      eq             = optional(list(string))
      eq_exact_match = optional(list(string))
      field          = string
      gt             = optional(string)
      gte            = optional(string)
      lt             = optional(string)
      lte            = optional(string)
      neq            = optional(list(string))
    })), [])
  }))
}
