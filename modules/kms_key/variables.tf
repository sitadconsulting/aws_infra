variable "kms_key_bypass_policy_lockout_safety_check" {
  description = "(Optional) Whether to bypass the key policy lockout safety check. Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately. For more information, refer to the scenario in the Default Key Policy section in the AWS KMS Developer Guide. The default value is false"
  type        = bool
  default     = false
}
variable "kms_key_custom_key_store_id" {
  description = "(Optional) ID of the KMS Custom Key Store where the key will be stored instead of KMS (eg CloudHSM)"
  type        = string
  default     = null
}
variable "kms_key_customer_master_key_spec" {
  description = "(Optional) Whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, HMAC_224, HMAC_256, HMAC_384, HMAC_512, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, ECC_SECG_P256K1, ML_DSA_44, ML_DSA_65, ML_DSA_87, SM2 (China Regions only), or ECC_NIST_EDWARDS25519. Defaults to SYMMETRIC_DEFAULT"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}
variable "kms_key_deletion_window_in_days" {
  description = "(Optional) Waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately"
  type        = number
  default     = 7
}
variable "kms_key_description" {
  description = "(Optional) Description of the key as viewed in AWS console"
  type        = string
  default     = null
}
variable "kms_key_enable_key_rotation" {
  description = "(Optional, required to be enabled if rotation_period_in_days is specified) Whether key rotation is enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "kms_key_is_enabled" {
  description = "(Optional) Whether the key is enabled. Defaults to true"
  type        = bool
  default     = true
}
variable "kms_key_key_usage" {
  description = "(Optional) Intended use of the key. Valid values: ENCRYPT_DECRYPT, SIGN_VERIFY, GENERATE_VERIFY_MAC, or KEY_AGREEMENT. Defaults to ENCRYPT_DECRYPT"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}
variable "kms_key_multi_region" {
  description = "(Optional) Whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false"
  type        = bool
  default     = false
}
variable "kms_key_policy" {
  description = "(Optional) Valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used"
  type        = string
  default     = null
}
variable "kms_key_rotation_period_in_days" {
  description = "(Optional) Custom period of time between each rotation date. Must be a number between 90 and 2560 (inclusive)"
  type        = number
  default     = null
}
variable "kms_key_tags" {
  description = "(Optional) Map of tags to assign to the object"
  type        = map(string)
  default     = {}
}
variable "kms_key_xks_key_id" {
  description = "(Optional) External key that serves as key material for the KMS key in an external key store"
  type        = string
  default     = null
}
