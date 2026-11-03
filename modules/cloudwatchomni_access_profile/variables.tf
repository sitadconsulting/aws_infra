variable "cloudwatchomni_access_profile_description" {
  description = "(Optional) Description of the access profile"
  type        = string
  default     = null
}
variable "cloudwatchomni_access_profile_name" {
  description = "(Required) Name of the access profile"
  type        = string
}
variable "cloudwatchomni_access_profile_space_id" {
  description = "(Required, Forces new resource) ID of the space that contains the access profile"
  type        = string
}
