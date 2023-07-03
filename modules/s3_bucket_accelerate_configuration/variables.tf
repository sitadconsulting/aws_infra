variable "s3_bucket_accelerate_configuration_bucket" {
  description = "Name of the bucket"
  type        = string
}
variable "s3_bucket_accelerate_configuration_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_accelerate_configuration_status" {
  description = "Transfer acceleration state of the bucket. Valid values: Enabled, Suspended"
  type        = string
  default     = "Suspended"
}
