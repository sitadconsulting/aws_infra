variable "iam_role_policy_attachments_exclusive_policy_arns" {
  description = "(Required) A list of managed IAM policy ARNs to be attached to the role. Policies attached to this role but not configured in this argument will be removed"
  type        = list(string)
}
variable "iam_role_policy_attachments_exclusive_role_name" {
  description = "(Required) IAM role name"
  type        = string
}
