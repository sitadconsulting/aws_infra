variable "kms_grant_grant_creation_tokens" {
  description = "A list of grant tokens to be used when creating the grant"
  type        = list(string)
  default     = []
}
variable "kms_grant_grantee_principal" {
  description = "The principal that is given permission to perform the operations that the grant permits in ARN format"
  type        = string
}
variable "kms_grant_key_id" {
  description = "The unique identifier for the customer master key (CMK) that the grant applies to. Specify the key ID or the Amazon Resource Name (ARN) of the CMK"
  type        = string
}
variable "kms_grant_name" {
  description = "A friendly name for identifying the grant"
  type        = string
  default     = ""
}
variable "kms_grant_operations" {
  description = " A list of operations that the grant permits. The permitted values are: Decrypt, Encrypt, GenerateDataKey, GenerateDataKeyWithoutPlaintext, ReEncryptFrom, ReEncryptTo, Sign, Verify, GetPublicKey, CreateGrant, RetireGrant, DescribeKey, GenerateDataKeyPair, or GenerateDataKeyPairWithoutPlaintext"
  type        = list(string)
}
variable "kms_grant_retire_on_delete" {
  description = "If set to false (the default) the grants will be revoked upon deletion, and if set to true the grants will try to be retired upon deletion"
  type        = bool
  default     = false
}
variable "kms_grant_retiring_principal" {
  description = "The principal that is given permission to retire the grant by using RetireGrant operation in ARN format"
  type        = string
  default     = null
}
variable "kms_grant_constraints" {
  description = "A structure that you can use to allow certain operations in the grant only when the desired encryption context is present"
  type        = list(object({
    encryption_context_equals = optional(map(string))
    encryption_context_subset = optional(map(string))
  }))
  default     = []
}
