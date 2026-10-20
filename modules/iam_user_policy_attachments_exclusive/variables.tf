variable "iam_user_policy_attachments_exclusive_policy_arns" {
  description = "(Required) A list of managed IAM policy ARNs to be attached to the user. Policies attached to this user but not configured in this argument will be removed"
  type        = list(string)
}
variable "iam_user_policy_attachments_exclusive_user_name" {
  description = "(Required) IAM user name"
  type        = string
}
