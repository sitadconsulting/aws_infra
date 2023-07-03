variable "rds_export_task_export_only" {
  description = "Data to be exported from the snapshot. If this parameter is not provided, all the snapshot data is exported"
  type        = string
  default     = ""
}
variable "rds_export_task_export_task_identifier" {
  description = "Unique identifier for the snapshot export task"
  type        = string
}
variable "rds_export_task_iam_role_arn" {
  description = "ARN of the IAM role to use for writing to the Amazon S3 bucket"
  type        = string
}
variable "rds_export_task_kms_key_id" {
  description = "ID of the Amazon Web Services KMS key to use to encrypt the snapshot"
  type        = string
}
variable "rds_export_task_s3_bucket_name" {
  description = "Name of the Amazon S3 bucket to export the snapshot to"
  type        = string
}
variable "rds_export_task_s3_prefix" {
  description = "Amazon S3 bucket prefix to use as the file name and path of the exported snapshot"
  type        = string
  default     = ""
}
variable "rds_export_task_source_arn" {
  description = "ARN of the snapshot to export"
  type        = string
}
