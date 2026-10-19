variable "iam_group_policies_exclusive_group_name" {
  description = "(Required) IAM group name"
  type        = string
}
variable "iam_group_policies_exclusive_policy_names" {
  description = "(Required) A list of inline policy names to be assigned to the group. Policies attached to this group but not configured in this argument will be removed. "
  type        = list(string)
}
