variable "iot_authorizer_authorizer_function_arn" {
  description = "(Required) The ARN of the authorizer's Lambda function"
  type        = string
}
variable "iot_authorizer_enable_caching_for_http" {
  description = "(Optional) Specifies whether the HTTP caching is enabled or not. Default: false"
  type        = bool
  default     = false
}
variable "iot_authorizer_name" {
  description = "(Required) The name of the authorizer"
  type        = string
}
variable "iot_authorizer_signing_disabled" {
  description = "(Optional) Specifies whether AWS IoT validates the token signature in an authorization request. Default: false"
  type        = bool
  default     = false
}
variable "iot_authorizer_status" {
  description = "(Optional) The status of Authorizer request at creation. Valid values: ACTIVE, INACTIVE. Default: ACTIVE"
  type        = string
  default     = null
}
variable "iot_authorizer_tags" {
  description = "(Optional) Map of tags to assign to this resource"
  type        = map(string)
  default     = {}
}
variable "iot_authorizer_token_key_name" {
  description = "(Optional) The name of the token key used to extract the token from the HTTP headers. This value is required if signing is enabled in your authorizer"
  type        = string
  default     = null
}
variable "iot_authorizer_token_signing_public_keys" {
  description = "(Optional) The public keys used to verify the digital signature returned by your custom authentication service. This value is required if signing is enabled in your authorizer"
  type        = string
  default     = null
}
