variable "iam_user_login_profile_user" {
  description = "(Required) The IAM user's name"
  type        = string
}
variable "iam_user_login_profile_pgp_key" {
  description = "(Optional) Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Only applies on resource creation. Drift detection is not possible with this argument"
  type        = string
  default     = null
}
variable "iam_user_login_profile_password_length" {
  description = "(Optional) The length of the generated password on resource creation. Only applies on resource creation. Drift detection is not possible with this argument. Default value is 20"
  type        = number
  default     = null
}
variable "iam_user_login_profile_password_reset_required" {
  description = "(Optional) Whether the user should be forced to reset the generated password on resource creation. Only applies on resource creation"
  type        = bool
  default     = null
}
