variable "ssoadmin_managed_policy_attachments_exclusive_instance_arn" {
  description = "(Required) ARN of the SSO Instance"
  type        = string
}
variable "ssoadmin_managed_policy_attachments_exclusive_managed_policy_arns" {
  description = "(Required) Set of ARNs of IAM managed policies to attach to the Permission Set"
  type        = list(string)
}
variable "ssoadmin_managed_policy_attachments_exclusive_permission_set_arn" {
  description = "(Required) ARN of the Permission Set"
  type        = string
}
