variable "kms_ciphertext_context" {
  description = "(Optional) Mapping that makes up the encryption context"
  type        = string
  default     = null
}
variable "kms_ciphertext_key_id" {
  description = "(Required) Globally unique key ID for the customer master key"
  type        = string
}
variable "kms_ciphertext_plaintext" {
  description = "(Optional, Exactly one of plaintext or plaintext_wo must be set) Data to be encrypted. Note that this may show up in logs, and it will be stored in the state file" 
  type        = string
  default     = null
}
variable "kms_ciphertext_plaintext_wo" {
  description = "(Optional, Write-Only, Exactly one of plaintext or plaintext_wo must be set) Data to be encrypted. Note that this may show up in logs. It will not be stored in the state file"
  type        = string
  default     = null
}
variable "kms_ciphertext_plaintext_wo_version" {
  description = "(Optional, Required when plaintext_wo is set) Triggers a replacement together with plaintext_wo. Modify this value when a replacement is required"
  type        = string
  default     = null
}
