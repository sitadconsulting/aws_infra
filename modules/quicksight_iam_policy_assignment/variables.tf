variable "quicksight_iam_policy_assignment_assignment_name" {
  description = "Name of the assignment"
  type        = string
}
variable "quicksight_iam_policy_assignment_assignment_status" {
  description = "Status of the assignment. Valid values are ENABLED, DISABLED, and DRAFT"
  type        = string
}
variable "quicksight_iam_policy_assignment_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_iam_policy_assignment_namespace" {
  description = "Namespace that contains the assignment. Defaults to default"
  type        = string
  default     = "default"
}
variable "quicksight_iam_policy_assignment_policy_arn" {
  description = "ARN of the IAM policy to apply to the Amazon QuickSight users and groups specified in this assignment"
  type        = string 
  default     = ""
}
variable "quicksight_iam_policy_assignment_identities" {
  description = "Amazon QuickSight users, groups, or both to assign the policy to"
  type        = list(object({
    user  = optional(string)
    group = optional(string)
  }))
}
