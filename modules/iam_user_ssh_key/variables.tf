variable "iam_user_ssh_key_encoding" {
  description = "Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM"
  type        = string
}
variable "iam_user_ssh_key_public_key" {
  description = "The SSH public key. The public key must be encoded in ssh-rsa format or PEM format"
  type        = string
}
variable "iam_user_ssh_key_status" {
  description = " he status to assign to the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used. Default is active"
  type        = string
  default     = "active"
}
variable "iam_user_ssh_key_username" {
  description = "The name of the IAM user to associate the SSH public key with"
  type        = string
}
