variable "iam_user_policies_exclusive_user_name" {
  description = "(Required) IAM user name"
  type        = string
}
variable "iam_user_policies_exclusive_policy_names" {
  description = "(Required) A list of inline policy names to be assigned to the user. Policies attached to this user but not configured in this argument will be removed"
  type        = list(string)
}
