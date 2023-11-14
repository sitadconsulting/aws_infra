variable "cognito_user_group_description" {
  description = "The description of the user group"
  type        = string
  default     = ""
}
variable "cognito_user_group_name" {
  description = "The name of the user group"
  type        = string
}
variable "cognito_user_group_precedence" {
  description = "The precedence of the user group"
  type        = string
  default     = ""
}
variable "cognito_user_group_role_arn" {
  description = "The ARN of the IAM role to be associated with the user group"
  type        = string
  default     = null
}
variable "cognito_user_group_user_pool_id" {
  description = "The user pool ID"
  type        = string
}
