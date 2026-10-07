variable "codebuild_report_group_delete_reports" {
  description = "(Optional) If true, deletes any reports that belong to a report group before deleting the report group. If false, you must delete any reports in the report group before deleting it. Default value is false"
  type        = bool
  default     = false
}
variable "codebuild_report_group_name" {
  description = "(Required) The name of a Report Group"
  type        = string
}
variable "codebuild_report_group_type" {
  description = "(Required) The type of the Report Group. Valid value are TEST and CODE_COVERAGE"
  type        = string
}
variable "codebuild_report_group_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "codebuild_report_group_export_config" {
  description = "(Required) Information about the destination where the raw data of this Report Group is exported"
  type        = list(object({
    type           = string
    s3_destination = list(object({
      bucket              = string
      encryption_key      = string
      encryption_disabled = optional(bool)
      packaging           = optional(string)
      path                = optional(string)
    }))
  }))
}
