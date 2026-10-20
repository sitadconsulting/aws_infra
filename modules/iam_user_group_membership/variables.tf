variable "iam_user_group_membership_user" {
  description = "(Required) The name of the IAM User to add to groups"
  type        = string
}
variable "iam_user_group_membership_groups" {
  description = "(Required) A list of IAM Groups to add the user to"
  type        = list(string)
}

