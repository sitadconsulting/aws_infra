variable "iot_thing_principal_attachment_principal" {
  description = "(Required) The AWS IoT Certificate ARN or Amazon Cognito Identity ID"
  type        = string
}
variable "iot_thing_principal_attachment_thing" {
  description = "(Required) The name of the thing"
  type        = string
}
variable "iot_thing_principal_attachment_thing_principal_type" {
  description = "(Optional) The type of relationship to specify when attaching a principal to a thing. Valid values are EXCLUSIVE_THING (the thing will be the only one attached to the principal) or NON_EXCLUSIVE_THING (multiple things can be attached to the principal). Defaults to NON_EXCLUSIVE_THING"
  type        = string
  default     = null
}
