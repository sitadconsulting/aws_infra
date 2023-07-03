variable "s3_bucket_cors_configuration_bucket" {
  description = "Name of the bucket"
  type        = string
}
variable "s3_bucket_cors_configuration_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_cors_configuration_cors_rule" {
  description = "Set of origins and methods rules"
  type        = list(object({
    allowed_headers = optional(list(string))
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = optional(list(string))
    id              = optional(string)
    max_age_seconds = optional(number)
  }))
  default     = []
}
