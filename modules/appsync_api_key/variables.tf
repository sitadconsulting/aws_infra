variable "appsync_api_key_api_id" {
  description = "(Required) ID of the associated AppSync API"
  type        = string
}
variable "appsync_api_key_description" {
  description = "(Optional) API key description. Defaults to \"Managed by Terraform\""
  type        = string
  default     = null
}
variable "appsync_api_key_expires" {
  description = "(Optional) RFC3339 string representation of the expiry date. Rounded down to nearest hour. By default, it is 7 days from the date of creation"
  type        = string
  default     = null
}
