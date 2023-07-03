variable "quicksight_group_membership_aws_account_id" {
  description = "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account"
  type        = string
  default     = ""
}
variable "quicksight_group_membership_member_name" {
  description = "The name of the member to add to the group"
  type        = string
}
variable "quicksight_group_membership_group_name" {
  description = "The name of the group in which the member will be added"
  type        = string
}
variable "quicksight_group_membership_namespace" {
  description = "The namespace. Defaults to default. Currently only default is supported"
  type        = string
}
