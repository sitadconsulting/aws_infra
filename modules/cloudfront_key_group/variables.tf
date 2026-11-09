variable "cloudfront_key_group_comment" {
  description = "(Optional) A comment to describe the key group"
  type        = string
  default     = null
}
variable "cloudfront_key_group_items" {
  description = "(Required) A list of the identifiers of the public keys in the key group"
  type        = list(string)
}
variable "cloudfront_key_group_name" {
  description = "(Required) A name to identify the key group"
  type        = string
}
