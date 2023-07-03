output "kms_alias_ciphertext_blob" {
  description = "Base64 encoded ciphertext"
  value       = element(concat(aws_kms_ciphertext.kms_ciphertext.*.ciphertext_blob, [""]), 0)
}
