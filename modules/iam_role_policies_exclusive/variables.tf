variable "iam_role_policies_exclusive_role_name" {
  description = "(Required) IAM role name"
  type        = string
}
variable "iam_role_policies_exclusive_policy_names" {
  description = "(Required) A list of inline policy names to be assigned to the role. Policies attached to this role but not configured in this argument will be removed"
  type        = list(string)
}
