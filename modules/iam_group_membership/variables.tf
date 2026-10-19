variable "iam_group_membership_name" {
  description = "(Required) The name to identify the Group Membership"
  type        = string
}
variable "iam_group_membership_users" {
  description = "(Required) A list of IAM User names to associate with the Group"
  type        = list(string)
}
variable "iam_group_membership_group" {
  description = "(Required) The IAM Group name to attach the list of users to"
  type        = string
}
