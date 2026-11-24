variable "kms_key_policy_bypass_policy_lockout_safety_check" {
  description = "(Optional) Whether to bypass the key policy lockout safety check. Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately. If this value is set, and the resource is destroyed, a warning will be shown, and the resource will be removed from state"
  type        = bool
  default     = false
}
variable "kms_key_policy_key_id" {
  description = "(Required) ID of the KMS Key to attach the policy"
  type        = string
}
variable "kms_key_policy_policy" {
  description = "(Required) Valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used"
  type        = string
}
