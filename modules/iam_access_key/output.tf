output "iam_access_key_encrypted_secret" {
  description = "Encrypted secret, base64 encoded, if pgp_key was specified"
  value       = element(concat(aws_iam_access_key.iam_access_key.*.encrypted_secret, [""]), 0)
}
output "iam_access_key_encrypted_ses_smtp_password_v4" {
  description = "Encrypted SES SMTP password, base64 encoded, if pgp_key was specified"
  value       = element(concat(aws_iam_access_key.iam_access_key.*.encrypted_ses_smtp_password_v4, [""]), 0)
}
output "iam_access_key_id" {
  description = "Access key ID"
  value       = element(concat(aws_iam_access_key.iam_access_key.*.id, [""]), 0)
}
output "iam_access_key_key_fingerprint" {
  description = "Fingerprint of the PGP key used to encrypt the secret"
  value       = element(concat(aws_iam_access_key.iam_access_key.*.key_fingerprint, [""]), 0)
}
output "iam_access_key_secret" {
  description = "Secret access key"
  value       = element(concat(aws_iam_access_key.iam_access_key.*.secret, [""]), 0)
  sensitive   = true
}
output "iam_access_key_ses_smtp_password_v4" {
  description = "Secret access key converted into an SES SMTP password by applying AWS's documented Sigv4 conversion algorithm"
  value       = element(concat(aws_iam_access_key.iam_access_key.*.ses_smtp_password_v4, [""]), 0)
}
