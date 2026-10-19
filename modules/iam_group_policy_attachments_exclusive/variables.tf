variable "iam_group_policy_attachments_exclusive_group_name" {
  description = "(Required) IAM group name"
  type        = string
}
variable "iam_group_policy_attachments_exclusive_policy_arns" {
  description = "(Required) A list of managed IAM policy ARNs to be attached to the group. Policies attached to this group but not configured in this argument will be removed "
  type        = list(string)
}
