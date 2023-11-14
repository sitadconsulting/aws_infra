variable "cognito_user_in_group_group_name" {
  description = "The name of the group to which the user is to be"
  type        = string
}
variable "cognito_user_in_group_user_pool_id" {
  description = "The user pool ID of the user and group"
  type        = string
}
variable "cognito_user_in_group_username" {
  description = "The username of the user to be added to the group"
  type        = string
}
