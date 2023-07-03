output "iam_user_login_profile_password" {
  description = "The plain text password, only available when pgp_key is not provided"
  value       = element(concat(aws_iam_user_login_profile.iam_user_login_profile.*.password, [""]), 0)
}
output "iam_user_login_profile_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the password. Only available if password was handled on Terraform resource creation, not import"
  value       = element(concat(aws_iam_user_login_profile.iam_user_login_profile.*.key_fingerprint, [""]), 0)
}
output "iam_user_login_profile_encrypted_password" {
  description = "The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import"
  value       = element(concat(aws_iam_user_login_profile.iam_user_login_profile.*.encrypted_password, [""]), 0)
}
