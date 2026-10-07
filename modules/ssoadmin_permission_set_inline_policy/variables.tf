variable "ssoadmin_permission_set_inline_policy_inline_policy" {
  description = "The IAM inline policy to attach to a Permission Set"
  type        = string
}
variable "ssoadmin_permission_set_inline_policy_instance_arnt" {
  description = "ARN of the SSO Instance under which the operation will be executed"
  type        = string
}
variable "ssoadmin_permission_set_inline_policy_permission_set_arn" {
  description = "ARN of the Permission Set"
  type        = string
}
