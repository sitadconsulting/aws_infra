variable "s3files_file_system_accept_bucket_warning" {
  description = "(Optional) Set to true to acknowledge and accept any warnings related to the bucket configuration. If not specified, the operation may fail when such warnings are present. For example, warnings may be raised when creating a file system scoped to a prefix containing a large number of objects (approximately 12 million objects)"
  type        = bool
  default     = true
}
variable "s3files_file_system_bucket" {
  description = "(Required) S3 bucket ARN. Changing this value forces replacement"
  type        = string
}
variable "s3files_file_system_kms_key_id" {
  description = "(Optional) KMS key ID for encryption. Changing this value forces replacement"
  type        = string
  default     = null
}
variable "s3files_file_system_prefix" {
  description = "(Optional) S3 bucket prefix. Changing this value forces replacement"
  type        = string
  default     = null
}
variable "s3files_file_system_role_arn" {
  description = "(Required) IAM role ARN for S3 access. Changing this value forces replacement"
  type        = string
}
variable "s3files_file_system_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = null
}
