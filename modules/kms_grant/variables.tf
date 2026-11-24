variable "kms_grant_grant_creation_tokens" {
  description = "(Optional, Forces new resources) List of grant tokens to be used when creating the grant"
  type        = list(string)
  default     = []
}
variable "kms_grant_grantee_principal" {
  description = "(Required, Forces new resources) Principal that is given permission to perform the operations that the grant permits in ARN format. Note that due to eventual consistency issues around IAM principals, Terraform's state may not always be refreshed to reflect what is true in AWS"
  type        = string
}
variable "kms_grant_key_id" {
  description = "(Required, Forces new resources) Unique identifier for the customer master key (CMK) that the grant applies to. Specify the key ID or the ARN of the CMK. To specify a CMK in a different AWS account, you must use the key ARN"
  type        = string
}
variable "kms_grant_name" {
  description = "(Optional, Forces new resources) Friendly name for identifying the grant"
  type        = string
  default     = null
}
variable "kms_grant_operations" {
  description = "(Required, Forces new resources) List of operations that the grant permits. The permitted values are: Decrypt, Encrypt, GenerateDataKey, GenerateDataKeyWithoutPlaintext, ReEncryptFrom, ReEncryptTo, Sign, Verify, GetPublicKey, CreateGrant, RetireGrant, DescribeKey, GenerateDataKeyPair, or GenerateDataKeyPairWithoutPlaintext"
  type        = list(string)
}
variable "kms_grant_retire_on_delete" {
  description = "(Optional, Forces new resources) If set to false (the default) the grants will be revoked upon deletion, and if set to true the grants will try to be retired upon deletion. Note that retiring grants requires special permissions, hence why we default to revoking grants"
  type        = bool
  default     = false
}
variable "kms_grant_retiring_principal" {
  description = "(Optional, Forces new resources) Principal that is given permission to retire the grant by using RetireGrant operation in ARN format. Note that due to eventual consistency issues around IAM principals, Terraform's state may not always be refreshed to reflect what is true in AWS"
  type        = string
  default     = null
}
variable "kms_grant_constraints" {
  description = "(Optional, Forces new resources) Structure that you can use to allow certain operations in the grant only when the desired encryption context is present"
  type        = list(object({
    encryption_context_equals = optional(map(string))
    encryption_context_subset = optional(map(string))
  }))
  default     = []
}
