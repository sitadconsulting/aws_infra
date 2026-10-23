variable "ebs_snapshot_description" {
  description = "(Optional) A description of what the snapshot is"
  type        = string
  default     = null
}
variable "ebs_snapshot_outpost_arn" {
  description = "(Optional) ARN of the Outpost on which to create a local snapshot"
  type        = string
  default     = null
}
variable "ebs_snapshot_permanent_restore" {
  description = "(Optional) Indicates whether to permanently restore an archived snapshot"
  type        = bool
  default     = null
}
variable "ebs_snapshot_storage_tier" {
  description = "(Optional) The name of the storage tier. Valid values are archive and standard. Default value is standard"
  type        = string
  default     = null
}
variable "ebs_snapshot_tags" {
  description = "(Optional) A map of tags to assign to the snapshot"
  type        = map(string)
  default     = {}
}
variable "ebs_snapshot_temporary_restore_days" {
  description = "(Optional) Specifies the number of days for which to temporarily restore an archived snapshot. Required for temporary restores only. The snapshot will be automatically re-archived after this period"
  type        = number
  default     = null
}
variable "ebs_snapshot_volume_id" {
  description = "(Required) The Volume ID of which to make a snapshot"
  type        = string
}
