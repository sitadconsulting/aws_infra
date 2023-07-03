variable "s3_bucket_logging_bucket" {
  description = "Name of the bucket"
  type        = string
}
variable "s3_bucket_logging_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_logging_target_bucket" {
  description = "Name of the bucket where you want Amazon S3 to store server access logs"
  type        = string
}
variable "s3_bucket_logging_target_prefix" {
  description = "Prefix for all log object keys"
  type        = string
}
variable "s3_bucket_logging_target_grant" {
  description = "configuration for granting bucket access permissions"
  type        = list(object({
    permission = string
    grantee    = list(object({
      email_address = optional(string)
      id            = optional(string)
      type          = string
      uri           = optional(string)
    }))
  }))
  default     = []
}
