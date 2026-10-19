variable "lb_trust_store_ca_certificates_bundle_s3_bucket" {
  description = "(Required) S3 Bucket name holding the client certificate CA bundle"
  type        = string
}
variable "lb_trust_store_ca_certificates_bundle_s3_key" {
  description = "(Required) S3 object key holding the client certificate CA bundle"
  type        = string
}
variable "lb_trust_store_ca_certificates_bundle_s3_object_version" {
  description = "(Optional) Version ID of CA bundle S3 bucket object, if versioned, defaults to latest if omitted"
  type        = string
  default     = null
}
variable "lb_trust_store_name" {
  description = "(Optional, Forces new resource) Name of the Trust Store. If omitted, Terraform will assign a random, unique name. This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen"
  type        = string
  default     = null
}
variable "lb_trust_store_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name. Cannot be longer than 6 characters"
  type        = string
  default     = null
}
variable "lb_trust_store_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
