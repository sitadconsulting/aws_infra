variable "cloudfront_key_value_store_comment" {
  description = "(Optional) Comment"
  type        = string
  default     = null
}
variable "cloudfront_key_value_store_name" {
  description = "(Required) Unique name for your CloudFront KeyValueStore"
  type        = string
}
