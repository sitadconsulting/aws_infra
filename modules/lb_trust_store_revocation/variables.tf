variable "lb_trust_store_revocation_revocations_s3_bucket" {
  description = "(Required) S3 Bucket name holding the client certificate CA bundle"
  type        = string
}
variable "lb_trust_store_revocation_revocations_s3_key" {
  description = "(Required) S3 object key holding the client certificate CA bundle"
  type        = string
}
variable "lb_trust_store_revocation_revocations_s3_object_version" {
  description = "(Optional) Version ID of CA bundle S3 bucket object, if versioned, defaults to latest if omitted"
  type        = string
  default     = null
}
variable "lb_trust_store_revocation_trust_store_arn" {
  description = "(Required) Trust Store ARN"
  type        = string
}
