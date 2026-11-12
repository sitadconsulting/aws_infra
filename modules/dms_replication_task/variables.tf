variable "dms_replication_task_cdc_start_position" {
  description = " (Optional, Conflicts with cdc_start_time) Indicates when you want a change data capture (CDC) operation to start. The value can be a RFC3339 formatted date, a checkpoint, or a LSN/SCN format depending on the source engine"
  type        = string
  default     = null
}
variable "dms_replication_task_cdc_start_time" {
  description = "(Optional, Conflicts with cdc_start_position) RFC3339 formatted date string or UNIX timestamp for the start of the Change Data Capture (CDC) operation"
  type        = string
  default     = null
}
variable "dms_replication_task_migration_type" {
  description = "(Required) Migration type. Can be one of full-load | cdc | full-load-and-cdc"
  type        = string
}
variable "dms_replication_task_replication_instance_arn" {
  description = "(Required) ARN of the replication instance"
  type        = string
}
variable "dms_replication_task_replication_task_id" {
  description = "(Required) Replication task identifier which must contain from 1 to 255 alphanumeric characters or hyphens, first character must be a letter, cannot end with a hyphen, and cannot contain two consecutive hyphens"
  type        = string
}
variable "dms_replication_task_replication_task_settings" {
  description = "(Optional) Escaped JSON string that contains the task settings. For a complete list of task settings, see Task Settings for AWS Database Migration Service Tasks. Note that Logging.CloudWatchLogGroup and Logging.CloudWatchLogStream are read only and should not be defined, even as null, in the configuration since AWS provides a value for these settings"
  type        = string
  default     = null
}
variable "dms_replication_task_resource_identifier" {
  description = "(Optional) A friendly name for the resource identifier at the end of the EndpointArn response parameter that is returned in the created Endpoint object"
  type        = string
  default     = null
}
variable "dms_replication_task_source_endpoint_arn" {
  description = "(Required) ARN that uniquely identifies the source endpoint"
  type        = string
}
variable "dms_replication_task_start_replication_task" {
  description = "(Optional) Whether to run or stop the replication task"
  type        = bool
  default     = null
}
variable "dms_replication_task_table_mappings" {
  description = "(Required) Escaped JSON string that contains the table mappings"
  type        = string
}
variable "dms_replication_task_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "dms_replication_task_target_endpoint_arn" {
  description = "(Required) ARN that uniquely identifies the target endpoint"
  type        = string
}
