variable "s3_bucket_website_configuration_bucket" {
  description = "Name of the bucket"
  type        = string
}
variable "s3_bucket_website_configuration_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_website_configuration_routing_rules" {
  description = "JSON array containing routing rules describing redirect behavior and when redirects are applied. Use this parameter when your routing rules contain empty String values ("")"
  type        = string
  default     = ""
}
variable "s3_bucket_website_configuration_error_document" {
  description = "Name of the error document for the website"
  type        = list(object({
    key = string
  }))
  default     = []
}
variable "s3_bucket_website_configuration_index_document" {
  description = "Name of the index document for the website"
  type        = list(object({
    suffix = string
  }))
  default     = []
}
variable "s3_bucket_website_configuration_redirect_all_requests_to" {
  description = "Redirect behavior for every request to this bucket's website endpoint"
  type        = list(object({
    host_name = string
    protocol  = optional(string)
  }))
  default     = []
}
variable "s3_bucket_website_configuration_routing_rule" {
  description = "List of rules that define when a redirect is applied and the redirect behavior"
  type        = list(object({
    condition = optional(list(object({
      http_error_code_returned_equals = optional(string)
      key_prefix_equals               = optional(string)
    })))
    redirect  = list(object({
      host_name               = optional(string)
      http_redirect_code      = optional(string)
      protocol                = optional(string)
      replace_key_prefix_with = optional(string)
      replace_key_with        = optional(string) 
    }))
  }))
  default     = [] 
}
