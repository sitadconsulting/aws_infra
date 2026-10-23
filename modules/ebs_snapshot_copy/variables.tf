variable "ebs_snapshot_copy_completion_duration_minutes" {
  description = "(Optional) Specifies a completion duration to initiate a time-based snapshot copy. Time-based snapshot copy operations complete within the specified duration. Value must be between 15 and 2880 minutes, in 15 minute increments only"
  type        = number
  default     = null
}
variable "ebs_snapshot_copy_description" {
  description = "(Optional) A description of what the snapshot is"
  type        = string
  default     = null
}
variable "ebs_snapshot_copy_encrypted" {
  description = "(optional) Whether the snapshot is encrypted"
  type        = bool
  default     = null
}
variable "ebs_snapshot_copy_kms_key_id" {
  description = "(optional) The ARN for the KMS encryption key"
  type        = string
  default     = null
}
variable "ebs_snapshot_copy_permanent_restore" {
  description = "(Optional) Indicates whether to permanently restore an archived snapshot"
  type        = bool 
  default     = null
}
variable "ebs_snapshot_copy_source_snapshot_id" {
  description = "(Required) The ARN for the snapshot to be copied"
  type        = string
}
variable "ebs_snapshot_copy_source_region" {
  description = "(Required) The region of the source snapshot"
  type        = string
}
variable "ebs_snapshot_copy_storage_tier" {
  description = "(Optional) The name of the storage tier. Valid values are archive and standard. Default value is standard"
  type        = string
  default     = null
}
variable "ebs_snapshot_copy_tags" {
  description = "(optional) A map of tags for the snapshot"
  type        = map(string)
  default     = {}
}
variable "ebs_snapshot_copy_temporary_restore_days" {
  description = "(Optional) Specifies the number of days for which to temporarily restore an archived snapshot. Required for temporary restores only. The snapshot will be automatically re-archived after this period"
  type        = number
  default     = null
}
