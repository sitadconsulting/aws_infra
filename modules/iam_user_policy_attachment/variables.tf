variable "iam_user_policy_attachment_policy_arn" {
  description = "(Required) - The ARN of the policy you want to apply"
  type        = string
}
variable "iam_user_policy_attachment_user" {
  description = "(Required) - The user the policy should be applied to"
  type        = string
}

