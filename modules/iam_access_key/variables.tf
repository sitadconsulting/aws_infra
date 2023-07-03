variable "iam_access_key_pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some_person_that_exists, for use in the encrypted_secret output attribute"
  type        = string
  default     = ""
}
variable "iam_access_key_status" {
  description = "Access key status to apply. Defaults to Active. Valid values are Active and Inactive"
  type        = string
  default     = "Active"
}
variable "iam_access_key_user" {
  description = "IAM user to associate with this access key"
  type        = string
  default     = ""
}
