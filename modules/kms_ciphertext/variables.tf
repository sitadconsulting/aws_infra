variable "kms_ciphertext_context" {
  description = "Mapping that makes up the encryption context"
  type        = string
  default     = ""
}
variable "kms_ciphertext_key_id" {
  description = "Globally unique key ID for the customer master key"
  type        = string
}
variable "kms_ciphertext_plaintext" {
  description = "Data to be encrypted. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}
