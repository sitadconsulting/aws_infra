output "iam_user_ssh_key_ssh_public_key_id" {
  description = "The unique identifier for the SSH public key"
  value       = element(concat(aws_iam_user_ssh_key.iam_user_ssh_key.*.ssh_public_key_id, [""]), 0)
}
output "iam_user_ssh_key_fingerprint" {
  description = "The MD5 message digest of the SSH public key" 
  value       = element(concat(aws_iam_user_ssh_key.iam_user_ssh_key.*.fingerprint, [""]), 0)
}
