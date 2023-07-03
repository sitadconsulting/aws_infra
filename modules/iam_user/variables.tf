variable "iam_user_force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed"
  type        = bool
  default     = false
}
variable "iam_user_name" {
  description = "The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces"
  type        = string
  default     = ""
}
variable "iam_user_path" {
  description = "Path in which to create the user"
  type        = string
  default     = "/"
}
variable "iam_user_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
  type        = string
  default     = ""
}
variable "iam_user_tags" {
  description = "Additional tags for the iam user resource"
  type        = map(string)
  default     = {}
}
