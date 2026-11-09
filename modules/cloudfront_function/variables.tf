variable "cloudfront_function_code" {
  description = "(Required) Source code of the function. Must be between 1 and 40960 bytes"
  type        = string
}
variable "cloudfront_function_comment" {
  description = "(Optional) Comment. Must not exceed 128 characters"
  type        = string
  default     = null
}
variable "cloudfront_function_key_value_store_associations" {
  description = "(Optional) List of aws_cloudfront_key_value_store ARNs to be associated to the function. AWS limits associations to one key value store per function"
  type        = list(string)
  default     = null
}
variable "cloudfront_function_name" {
  description = "(Required) Unique name for your CloudFront Function. Valid names contain only alphanumeric characters, hyphens, and underscores, and must be between 1 and 64 characters"
  type        = string
}
variable "cloudfront_function_publish" {
  description = "(Optional) Whether to publish creation/change as Live CloudFront Function Version. Defaults to true"
  type        = bool
  default     = true
}
variable "cloudfront_function_runtime" {
  description = "(Required) Identifier of the function's runtime. Valid values are cloudfront-js-1.0 and cloudfront-js-2.0."
  type        = string
}
variable "cloudfront_function_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
