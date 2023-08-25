variable "kms_replica_key_bypass_policy_lockout_safety_check" {
  description = "A flag to indicate whether to bypass the key policy lockout safety check. Setting this value to true increases the risk that the KMS key becomes unmanageable"
  type        = bool
  default     = false
}
variable "kms_replica_key_description" {
  description = "A description of the KMS key"
  type        = string
  default     = ""
}
variable "kms_replica_key_deletion_window_in_days" {
  description = "he waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30"
  type        = number
  default     = 7
}
variable "kms_replica_key_enabled" {
  description = "Specifies whether the replica key is enabled. Disabled KMS keys cannot be used in cryptographic operations. The default value is true"
  type        = bool
  default     = true
}
variable "kms_replica_key_policy" {
  description = "The key policy to attach to the KMS key. If you do not specify a key policy, AWS KMS attaches the default key policy to the KMS key"
  type        = string
  default     = null
}
variable "kms_replica_key_primary_key_arn" {
  description = "The ARN of the multi-Region primary key to replicate. The primary key must be in a different AWS Region of the same AWS Partition"
  type        = string
}
variable "kms_replica_key_tags" {
  description = "A map of tags to assign to the replica key"
  type        = map(string)
  default     = {}
}
