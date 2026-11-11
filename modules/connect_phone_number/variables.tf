variable "connect_phone_number_country_code" {
  description = "(Required, Forces new resource) The ISO country code"
  type        = string
}
variable "connect_phone_number_description" {
  description = "(Optional, Forces new resource) The description of the phone number"
  type        = string
  default     = null
}
variable "connect_phone_number_prefix" {
  description = "(Optional, Forces new resource) The prefix of the phone number that is used to filter available phone numbers. If provided, it must contain + as part of the country code. Do not specify this argument when importing the resource."
  type        = string
  default     = null
}
variable "connect_phone_number_tags" {
  description = "(Optional) Tags to apply to the Phone Number"
  type        = map(string)
  default     = {}
}
variable "connect_phone_number_target_arn" {
  description = "(Required) ARN for Amazon Connect instances that phone numbers are claimed to"
  type        = string
}
variable "connect_phone_number_type" {
  description = "(Required, Forces new resource) The type of phone number. Valid Values: TOLL_FREE | DID"
  type        = string
}
