variable "cloudfront_connection_function_connection_function_code" {
  description = "(Required) Code for the connection function. Maximum length is 40960 characters"
  type        = string
}
variable "cloudfront_connection_function_name" {
  description = "(Required) Name for the connection function. Must be 1-64 characters and can contain letters, numbers, hyphens, and underscores. Changing this forces a new resource to be created"
  type        = string
}
variable "cloudfront_connection_function_publish" {
  description = "(Optional) Whether to publish the function to the LIVE stage after creation or update. Defaults to false"
  type        = bool
  default     = false
}
variable "cloudfront_connection_function_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudfront_connection_function_connection_function_config" {
  description = "(Required) Configuration information for the connection function"
  type        = list(object({
    comment                     = string
    runtime                     = string
    key_value_store_association = optional(list(object({
      key_value_store_arn = string
    })),[])
  }))
}
