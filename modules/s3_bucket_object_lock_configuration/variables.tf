variable "s3_bucket_object_lock_configuration_bucket" {
  description = "Name of the bucket"
  type        = string
}
variable "s3_bucket_object_lock_configuration_bucket_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_object_lock_configuration_object_lock_enabled" {
  description = "Indicates whether this bucket has an Object Lock configuration enabled. Defaults to Enabled. Valid values: Enabled"
  type        = string
  default     = ""
}
variable "s3_bucket_object_lock_configuration_token" {
  description = "Token to allow Object Lock to be enabled for an existing bucket. You must contact AWS support for the bucket's "Object Lock token". The token is generated in the back-end when versioning is enabled on a bucket"
  type        = string
  default     = ""
}
variable "s3_bucket_object_lock_configuration_rule" {
  description = "Object Lock rule configuration for the specified object"
  type        = list(object({
    days  = optional(number)
    mode  = optional(string)
    years = optional(number)
  }))
  default     = []
}
