variable "kms_key_policy_bypass_policy_lockout_safety_check" {
  description = "A flag to indicate whether to bypass the key policy lockout safety check. Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately "
  type        = bool
  default     = false
}
variable "kms_key_policy_key_id" {
  description = "The ID of the KMS Key to attach the policy"
  type        = string
}
variable "kms_key_policy_policy" {
  description = "A valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used"
  type        = string
}
