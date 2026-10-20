variable "iam_service_linked_role_aws_service_name" {
  description = "(Required, Forces new resource) The AWS service to which this role is attached. You use a string similar to a URL but without the http:// in front. For example: elasticbeanstalk.amazonaws.com. To find the full list of services that support service-linked roles"
  type        = string
}
variable "iam_service_linked_role_custom_suffix" {
  description = "(Optional, forces new resource) Additional string appended to the role name. Not all AWS services support custom suffixes"
  type        = string
  default     = null
}
variable "iam_service_linked_role_description" {
  description = "(Optional) The description of the role"
  type        = string
  default     = null
}
variable "iam_service_linked_role_tags" {
  description = "Key-value mapping of tags for the IAM role"
  type        = map(string)
  default     = {}
}
