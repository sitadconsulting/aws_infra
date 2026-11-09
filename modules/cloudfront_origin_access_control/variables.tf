variable "cloudfront_origin_access_control_description" {
  description = "(Optional) The description of the Origin Access Control. Defaults to \"Managed by Terraform\" if omitted"
  type        = string
  default     = null
}
variable "cloudfront_origin_access_control_name" {
  description = "(Required) A name that identifies the Origin Access Control"
  type        = string
}
variable "cloudfront_origin_access_control_origin_access_control_origin_type" {
  description = "(Required) The type of origin that this Origin Access Control is for. Valid values are lambda, mediapackagev2, mediastore, and s3"
  type        = string
}
variable "cloudfront_origin_access_control_signing_behavior" {
  description = "(Required) Specifies which requests CloudFront signs. Specify always for the most common use case. Allowed values: always, always-amz-auth, never, and no-override. always-amz-auth is supported only for Lambda Web Function origins, and is the only value those origins support"
  type        = string
}
variable "cloudfront_origin_access_control_signing_protocol" {
  description = "(Required) Determines how CloudFront signs (authenticates) requests. Valid values are sigv4 and sigv4a"
  type        = string
}
