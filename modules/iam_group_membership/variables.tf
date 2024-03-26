variable "iam_group_membership_name" {
  description = "The name to identify the Group Membership"
  type        = string
  default     = ""
}
variable "iam_group_membership_users" {
  description = "A list of IAM User names to associate with the Group"
  type        = list
  default     = []
}
variable "iam_group_membership_group" {
  description = "The IAM Group name to attach the list of users to"
  type        = string
  default     = ""
}
