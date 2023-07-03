variable "quicksight_group_aws_account_id" {
  description = "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account"
  type        = string
  default     = ""
}
variable "quicksight_group_description" {
  description = "A description for the group"
  type        = string
  default     = ""
}
variable "quicksight_group_group_name" {
  description = "A name for the group"
  type        = string
}
variable "quicksight_group_namespace" {
  description = "The namespace. Currently, you should set this to default"
  type        = string
  default     = "default"
}
