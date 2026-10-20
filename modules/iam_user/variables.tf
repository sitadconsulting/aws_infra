variable "iam_user_force_destroy" {
  description = "(Optional, default false) When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. This only deletes objects when the user is destroyed, not when setting this parameter to true. Once this parameter is set to true, there must be a successful terraform apply run before a destroy is required to update this value in the resource state. Without a successful terraform apply after this parameter is set, this flag will have no effect. If setting this field in the same operation that would require replacing the user or destroying the user, this flag will not work. Additionally when importing a user, a successful terraform apply is required to set this value in state before it will take effect on a destroy operation"
  type        = bool
  default     = false
}
variable "iam_user_name" {
  description = "(Required) The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. User names are not distinguished by case. For example, you cannot create users named both \"TESTUSER\" and \"testuser\""
  type        = string
}
variable "iam_user_path" {
  description = "(Optional, default \"/\") Path in which to create the user"
  type        = string
  default     = "/"
}
variable "iam_user_permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the user"
  type        = string
  default     = null
}
variable "iam_user_tags" {
  description = "Key-value map of tags for the IAM user"
  type        = map(string)
  default     = {}
}
