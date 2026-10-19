variable "iam_policy_attachment_groups" {
  description = "(Optional) - Group(s) the policy should be applied to"
  type        = list(string)
  default     = null
}
variable "iam_policy_attachment_name" {
  description = "(Required) - Name of the attachment. This cannot be an empty string"
  type        = string
}
variable "iam_policy_attachment_policy_arn" {
  description = "(Required) - ARN of the policy you want to apply. Typically this should be a reference to the ARN of another resource to ensure dependency ordering, such as aws_iam_policy.example.arn"
  type        = string
}
variable "iam_policy_attachment_users" {
  description = "(Optional) - User(s) the policy should be applied to"
  type        = list(string)
  default     = null
}
variable "iam_policy_attachment_roles" {
  description = "(Optional) - Role(s) the policy should be applied to"
  type        = list(string)
  default     = null
}
