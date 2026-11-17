variable "dynamodb_table_export_export_format" {
  description = "(Optional, Forces new resource) Format for the exported data. Valid values are: DYNAMODB_JSON, ION. Default is DYNAMODB_JSON"
  type        = string
  default     = null
}
variable "dynamodb_table_export_export_time" {
  description = "(Optional, Forces new resource) Time in RFC3339 format from which to export table data. The table export will be a snapshot of the table's state at this point in time. Omitting this value will result in a snapshot from the current time"
  type        = string
  default     = null
}
variable "dynamodb_table_export_export_type" {
  description = "(Optional, Forces new resource) Whether to execute as a full export or incremental export. Valid values are: FULL_EXPORT, INCREMENTAL_EXPORT. Defaults to FULL_EXPORT. If INCREMENTAL_EXPORT is provided, the incremental_export_specification argument must also be provided. incremental_export_specification - (Optional, Forces new resource) Parameters specific to an incremental export"
  type        = string
  default     = null
}
variable "dynamodb_table_export_s3_bucket" {
  description = "(Required, Forces new resource) Name of the Amazon S3 bucket to export the snapshot to"
  type        = string
}
variable "dynamodb_table_export_s3_bucket_owner" {
  description = "(Optional, Forces new resource) ID of the AWS account that owns the bucket the export will be stored in"
  type        = string
  default     = null
}
variable "dynamodb_table_export_s3_prefix" {
  description = "(Optional, Forces new resource) Amazon S3 bucket prefix to use as the file name and path of the exported snapshot"
  type        = string
  default     = null
}
variable "dynamodb_table_export_s3_sse_algorithm" {
  description = "(Optional, Forces new resource) Type of encryption used on the bucket where export data will be stored. Valid values are: AES256, KMS"
  type        = string
  default     = null
}
variable "dynamodb_table_export_s3_sse_kms_key_id" {
  description = "(Optional, Forces new resource) ID of the AWS KMS managed key used to encrypt the S3 bucket where export data will be stored (if applicable)"
  type        = string
  default     = null
}
variable "dynamodb_table_export_table_arn" {
  description = "(Required, Forces new resource) ARN associated with the table to export"
  type        = string
}
variable "dynamodb_table_export_incremental_export_specification" {
  description = "(Optional, Forces new resource) Parameters specific to an incremental export"
  type        = list(object({
    export_from_time = optional(string)
    export_to_time   = optional(string)
    export_view_type = optional(string)
  }))
  default     = []
}
