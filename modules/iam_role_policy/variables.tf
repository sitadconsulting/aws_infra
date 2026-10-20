variable "iam_role_policy_name" {
  description = "(Optional) The name of the role policy. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "iam_role_policy_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = strimg
  default     = null
}
variable "iam_role_policy_policy" {
  description = "(Required) The inline policy document. This is a JSON formatted string"
  type        = string
}
variable "iam_role_policy_role" {
  description = "(Required) The name of the IAM role to attach to the policy"
  type        = string
}
