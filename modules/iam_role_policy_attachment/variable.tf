variable "iam_role_policy_attachment_policy_arn" {
  description = "The ARN of the policy you want to apply"
  type     =  string
}
variable "iam_role_policy_attachment_role" {
  description = "The name of the IAM role to which the policy should be applied"
  type     = string
}
