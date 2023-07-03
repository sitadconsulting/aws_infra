variable "iam_user_group_membership_user" {
  description = "The name of the IAM User to add to groups"
  type        = string
}
variable "iam_user_group_membership_groups" {
  description = "A list of IAM Groups to add the user to"
  type        = list(string)
}

