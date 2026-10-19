variable "iam_group_policy_group" {
  description = "(Required) The IAM group to attach to the policy"
  type        = string
}
variable "iam_group_policy_name" {
  description = "(Optional) The name of the policy. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "iam_group_policy_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "iam_group_policy_policy" {
  description = "(Required) The policy document. This is a JSON formatted string"
  type        = string
}
