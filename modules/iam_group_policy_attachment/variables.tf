variable "iam_group_policy_attachment_group" {
  description = " (Required) - The group the policy should be applied to"
  type        = string
}
variable "iam_group_policy_attachment_policy_arn" {
  description = " (Required) - The ARN of the policy you want to apply"
  type        = string
}
