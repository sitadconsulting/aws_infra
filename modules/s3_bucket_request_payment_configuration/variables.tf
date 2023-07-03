variable "s3_bucket_request_payment_configuration_bucket" {
  description = "Name of the bucket"
  type        = string
}
variable "s3_bucket_request_payment_configuration_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_request_payment_configuration_payer" {
  description = "Specifies who pays for the download and request fees. Valid values: BucketOwner, Requester"
  type        = string
}
