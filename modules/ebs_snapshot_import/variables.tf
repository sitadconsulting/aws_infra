variable "ebs_snapshot_import_description" {
  description = "(Optional) The description string for the import snapshot task"
  type        = string
  default     = null
}
variable "ebs_snapshot_import_encrypted" {
  description = "(Optional) Specifies whether the destination snapshot of the imported image should be encrypted. The default KMS key for EBS is used unless you specify a non-default KMS key using KmsKeyId"
  type        = bool
  default     = null
}
variable "ebs_snapshot_import_kms_key_id" {
  description = "(Optional) An identifier for the symmetric KMS key to use when creating the encrypted snapshot. This parameter is only required if you want to use a non-default KMS key; if this parameter is not specified, the default KMS key for EBS is used. If a KmsKeyId is specified, the Encrypted flag must also be set"
  type        = string
  default     = null
}
variable "ebs_snapshot_import_permanent_restore" {
  description = "(Optional) Indicates whether to permanently restore an archived snapshot"
  type        = bool
  default     = null
}
variable "ebs_snapshot_import_role_name" {
  description = "(Optional) The name of the IAM Role the VM Import/Export service will assume. This role needs certain permissions. Default: vmimport"
  type        = string
  default     = null
}
variable "ebs_snapshot_import_storage_tier" {
  description = "(Optional) The name of the storage tier. Valid values are archive and standard. Default value is standard"
  type        = string
  default     = null
}
variable "ebs_snapshot_import_tags" {
  description = "Optional) A map of tags to assign to the snapshot"
  type        = map(string)
  default     = {}
}
variable "ebs_snapshot_import_temporary_restore_days" {
  description = "(Optional) Specifies the number of days for which to temporarily restore an archived snapshot. Required for temporary restores only. The snapshot will be automatically re-archived after this period"
  type        = number
  default     = null
}
variable "ebs_snapshot_import_client_data" {
  description = "Optional) The client-specific data"
  type        = list(object({
    comment      = optional(string)
    upload_start = optional(string)
    upload_end   = optional(string)
    upload_size  = optional(number)
  }))
  default     = []
}
variable "ebs_snapshot_import_disk_container" {
  description = "(Required) Information about the disk container"
  type        = list(object({
    description = optional(string)
    format      = string
    url         = optional(string)
    user_bucket = optional(list(object({
      s3_bucket = string
      s3_key    = string
    })), []) 
  }))
}
