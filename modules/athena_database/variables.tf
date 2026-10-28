variable "athena_database_bucket" {
  description = "(Required) Name of S3 bucket to save the results of the query execution"
  type        = string
}
variable "athena_database_comment" {
  description = " (Optional) Description of the database"
  type        = string
  default     = null
}
variable "athena_database_expected_bucket_owner" {
  description = "(Optional) AWS account ID that you expect to be the owner of the Amazon S3 bucket"
  type        = string
  default     = null
}
variable "athena_database_force_destroy" {
  description = "(Optional, Default: false) Boolean that indicates all tables should be deleted from the database so that the database can be destroyed without error. The tables are not recoverable"
  type        = bool
  default     = false
}
variable "athena_database_name" {
  description = "(Required) Name of the database to create"
  type        = string
}
variable "athena_database_properties" {
  description = "(Optional) Key-value map of custom metadata properties for the database definition"
  type        = map(string)
  default     = {}
}
variable "athena_database_workgroup" {
  description = "(Optional) Name of the workgroup"
  type        = string
  default     = null
}
variable "athena_database_acl" {
  description = "(Optional) That an Amazon S3 canned ACL should be set to control ownership of stored query results"
  type        = list(object({
    s3_acl_option = string
  }))
  default     = []
}
variable "athena_database_encryption_configuration" {
  description = "(Optional) Encryption key block AWS Athena uses to decrypt the data in S3, such as a KMS key"
  type        = list(object({
    encryption_option = string
    kms_key           = optional(string)
  }))
  default     = []
}
