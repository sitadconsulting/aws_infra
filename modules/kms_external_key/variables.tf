variable "kms_external_key_bypass_policy_lockout_safety_check" {
  description = "Specifies whether to disable the policy lockout check performed when creating or updating the key's policy. Setting this value to true increases the risk that the key becomes unmanageable"
  type        = bool
  default     = false
}
variable "kms_external_key_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource. Must be between 7 and 30 days. Defaults to 30"
  type        = number
  default     = 30
}
variable "kms_external_key_description" {
  description = " Description of the key"
  type        = string
  default     = ""
}
variable "kms_external_key_enabled" {
  description = "Specifies whether the key is enabled. Keys pending import can only be false. Imported keys default to true unless expired"
  type        = bool
  default     = true
}
variable "kms_external_key_key_material_base64" {
  description = "Base64 encoded 256-bit symmetric encryption key material to import. The CMK is permanently associated with this key material"
  type        = string
  default     = ""
}
variable "kms_external_key_multi_region" {
  description = "Indicates whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false"
  type        = bool
  default     = false
}
variable "kms_external_key_policy" {
  description = "A key policy JSON document. If you do not provide a key policy, AWS KMS attaches a default key policy to the CMK"
  type        = string
  default     = ""
}
variable "kms_external_key_tags" {
  description = "A key-value map of tags to assign to the key"
  type        = map(string)
  default     = {}
}
variable "kms_external_key_valid_to" {
  description = "Time at which the imported key material expires. When the key material expires, AWS KMS deletes the key material and the CMK becomes unusable"
  type        = string
  default     = ""
}
