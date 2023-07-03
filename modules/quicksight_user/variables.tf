variable "quicksight_user_aws_account_id" {
  description = "The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account"
  type        = string
  default     = ""
}
variable "quicksight_user_email" {
  description = "The email address of the user that you want to register"
  type        = string
}
variable "quicksight_user_iam_arn" {
  description = "The ARN of the IAM user or role that you are registering with Amazon QuickSight"
  type        = string
  default     = ""
}
variable "quicksight_user_identity_type" {
  description = "Amazon QuickSight supports several ways of managing the identity of users. This parameter accepts either IAM or QUICKSIGHT. If IAM is specified, the iam_arn must also be specified"
  type        = string
}
variable "quicksight_user_namespace" {
  description = "The Amazon Quicksight namespace to create the user in. Defaults to default"
  type        = string
  default     = ""
}
variable "quicksight_user_session_name" {
  description = "The name of the IAM session to use when assuming roles that can embed QuickSight dashboards. Only valid for registering users using an assumed IAM role. Additionally, if registering multiple users using the same IAM role, each user needs to have a unique session name"
  type        = string
  default     = ""
}
variable "quicksight_user_user_name" {
  description = "The Amazon QuickSight user name that you want to create for the user you are registering. Only valid for registering a user with identity_type set to QUICKSIGHT"
  type        = string
  default     = ""
}
variable "quicksight_user_user_role" {
  description = "The Amazon QuickSight role of the user. The user role can be one of the following: READER, AUTHOR, or ADMIN"
  type        = string
}
