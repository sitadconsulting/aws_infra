variable "iam_group_policy_group" {
  description = "IAM group policy group name"
  type        = string
}
variable "iam_group_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}
variable "iam_group_policy_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "iam_group_policy_policy" {
  description = "The policy document. This is a JSON formatted string"
  type        = string
}
