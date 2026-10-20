variable "iam_user_policy_policy" {
  description = "(Required) The policy document. This is a JSON formatted string"
  type        = string
}
variable "iam_user_policy_name" {
  description = "(Optional) The name of the policy. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "iam_user_policy_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "iam_user_policy_user" {
  description = "(Required) IAM user to which to attach this policy"
  type        = string
}
