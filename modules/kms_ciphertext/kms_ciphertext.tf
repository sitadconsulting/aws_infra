resource "aws_kms_ciphertext" "kms_ciphertext" {
  context              = var.kms_ciphertext_context
  key_id               = var.kms_ciphertext_key_id
  plaintext            = var.kms_ciphertext_plaintext
  plaintext_wo         = var.kms_ciphertext_plaintext_wo
  plaintext_wo_version = var.kms_ciphertext_plaintext_wo_version 
}
