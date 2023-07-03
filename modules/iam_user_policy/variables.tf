variable "iam_user_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}
variable "iam_user_policy_policy" {
  description = "The policy document. This is a JSON formatted string"
  type        = string
}
variable "iam_user_policy_user" {
  description = "IAM user to which to attach this policy"
  type        = string
}
