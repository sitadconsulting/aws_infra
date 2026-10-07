variable "ssoadmin_managed_policy_attachment_instance_arn" {
  description = "ARN of the SSO Instance under which the operation will be executed"
  type        = string
}
variable "ssoadmin_managed_policy_attachment_permission_set_arn" {
  description = "ARN of the Permission Set"
  type        =  string
}
variable "ssoadmin_managed_policy_attachment_managed_policy_arn" {
  description = "ARN of IAM Policy to be attached to the Permission Set"
  type        = string
}
