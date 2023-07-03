variable "iam_user_login_profile_user" {
  description = "The IAM user's name"
  type        = string
}
variable "iam_user_login_profile_pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Only applies on resource creation"
  type        = string
  default     = ""
}
variable "iam_user_login_profile_password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on resource creation. Only applies on resource creation"
  type        = bool
  default     = true
}
variable "iam_user_login_profile_password_length" {
  description = "The length of the generated password on resource creation. Only applies on resource creation default is 20"
  type        = number
  default     = 20
}
