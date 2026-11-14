variable "datasync_task_destination_location_arn" {
  description = "(Required) ARN of destination DataSync Location "
  type        = string
}
variable "datasync_task_source_location_arn" {
  description = "(Required) ARN of source DataSync Location"
  type        = string
}
variable "datasync_task_cloudwatch_log_group_arn" {
  description = "(Optional) ARN of the CloudWatch Log Group that is used to monitor and log events in the sync task"
  type        = string
}
variable "datasync_task_name" {
  description = "(Optional) Name of the DataSync Task"
  type        = string
}
variable "datasync_task_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Task"
  type        = map(string)
  default     = {}
}
variable "datasync_task_task_mode" {
  description = "(Optional) One of the following task modes for your data transfer: BASIC (default) - Transfer files or objects between Amazon Web Services storage and on-premises, edge, or other cloud storage. ENHANCED - Transfer virtually unlimited numbers of objects with enhanced metrics, more detailed logs, and higher performance than Basic mode. Currently available for transfers between Amazon S3 locations"
  type        = string
  default     = null
}
variable "datasync_task_excludes" {
  description = "(Optional) Filter rules that determines which files to exclude from a task"
  type        = list(object({
    filter_type = optional(string)
    value       = optional(string)
  }))
  default     = []
}
variable "datasync_task_includes" {
  description = "(Optional) Filter rules that determines which files to include in a task"
  type        = list(object({
    filter_type = optional(string)
    value       = optional(string)
  }))
  default     = []
}
variable "datasync_task_options" {
  description = "(Optional) Configuration block containing option that controls the default behavior when you start an execution of this DataSync Task. For each individual task execution, you can override these options by specifying an overriding configuration in those executions"
  type        = list(object({
    atime                          = optional(string)
    bytes_per_second               = optional(number)
    gid                            = optional(string)
    log_level                      = optional(string)
    mtime                          = optional(string)
    object_tags                    = optional(string)
    overwrite_mode                 = optional(string)
    posix_permissions              = optional(string)
    preserve_deleted_files         = optional(string)
    preserve_devices               = optional(string)
    security_descriptor_copy_flags = optional(string)
    task_queueing                  = optional(string)
    transfer_mode                  = optional(string)
    uid                            = optional(string)
    verify_mode                    = optional(string)
  }))
  default     = []
}
variable "datasync_task_schedule" {
  description = "(Optional) Specifies a schedule used to periodically transfer files from a source to a destination location"
  type        = list(object({
    schedule_expression = string
    status              = optional(string)
  }))
  default     = []
}
variable "datasync_task_task_report_config" {
  description = "(Optional) Configuration block containing the configuration of a DataSync Task Report"
  type        = list(object({
    s3_object_versioning = optional(string)
    output_type          = optional(string)
    report_level         = optional(string)
    s3_destination       = list(object({
      bucket_access_role_arn = string
      s3_bucket_arn          = string
      subdirectory           = optional(string)
    }))
    report_overrides     = optional(list(object({
      deleted_override     = optional(string)
      skipped_override     = optional(string)
      transferred_override = optional(string)
      verified_override    = optional(string)
    })), [])
  }))
  default     = []
}
