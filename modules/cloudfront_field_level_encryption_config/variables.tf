variable "cloudfront_field_level_encryption_config_comment" {
  description = "(Optional) An optional comment about the Field Level Encryption Config"
  type        = string
  default     = null
}
variable "cloudfront_field_level_encryption_config_content_type_profile_config" {
  description = "(Required) Content Type Profile Config specifies when to forward content if a content type isn't recognized and profiles to use as by default in a request if a query argument doesn't specify a profile to use"
  type        = list(object({
    forward_when_content_type_is_unknown = bool
    content_type_profiles                = list(object({
      content_type = string
      format       = string
      profile_id   = optional(string)
    }))
  }))
}
variable "cloudfront_field_level_encryption_config_query_arg_profile_config" {
  description = "(Required) Query Arg Profile Config that specifies when to forward content if a profile isn't found and the profile that can be provided as a query argument in a request"
  type        = list(object({
    forward_when_query_arg_profile_is_unknown = bool
    query_arg_profiles                        = optional(list(object({
      profile_id = string
      query_arg  = string
    })), [])
  }))
}
