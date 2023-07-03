variable "iam_group_policy_attachment_group" {
  description = "The group the policy should be applied to"
  type        = string
}
variable "iam_group_policy_attachment_policy_arn" {
  description = "The ARN of the policy you want to apply"
  type        = string
}
