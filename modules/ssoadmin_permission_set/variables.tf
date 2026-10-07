variable "ssoadmin_permission_set_description" {
  description = "The description of the Permission Set"
  type        = string
  default     = null
}
variable "ssoadmin_permission_set_instance_arn" {
  description = "ARN of the SSO Instance under which the operation will be executed"
  type        = string
}
variable "ssoadmin_permission_set_name" {
  description = "The name of the Permission Set"
  type        = string
}
variable "ssoadmin_permission_set_relay_state" {
  description = "The relay state URL used to redirect users within the application during the federation authentication process"
  type        = string
  default     = null
}
variable "ssoadmin_permission_set_session_duration" {
  description = "The length of time that the application user sessions are valid in the ISO-8601 standard. Default: PT1H"
  type        = string
  default     = "PT1H"
}
variable "ssoadmin_permission_set_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
