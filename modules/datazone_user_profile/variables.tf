variable "datazone_user_profile_domain_identifier" {
  description = "(Required) The domain identifier"
  type        = string
}
variable "datazone_user_profile_user_identifier" {
  description = "(Required) The user identifier"
  type        = string
}
variable "datazone_user_profile_user_type" {
  description = "(Optional) The user type"
  type        = string
  default     = null
}
variable "datazone_user_profile_status" {
  description = "(Optional) The user profile status"
  type        = string
  default     = null
}
