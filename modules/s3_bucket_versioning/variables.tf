variable "s3_bucket_versioning_bucket" {
  description = "Name of the S3 bucket"
  type        = string
}
variable "s3_bucket_versioning_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_versioning_mfa" {
  description = "Concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device - Required if versioning_configuration mfa_delete is enabled"
  type        = string
  default     = ""
}
variable "s3_bucket_versioning_versioning_configuration" {
  description = "versioning configuration"
  type        = list(object({
    mfa_delete = optional(string)
    status     = string
  }))
  default     = []
}
