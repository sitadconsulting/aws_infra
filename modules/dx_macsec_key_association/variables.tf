variable "dx_macsec_key_association_cak" {
  description = "(Optional) MAC Security (MACsec) CAK to associate with the dedicated connection. Valid values are 64 hexadecimal characters (0-9, A-F). Required with ckn or ckn_wo unless cak_wo is configured. Conflicts with cak_wo. Changing this argument replaces the association"
  type        = string
  default     = null
}
variable "dx_macsec_key_association_cak_wo" {
  description = "(Optional) Write-only MAC Security (MACsec) CAK to associate with the dedicated connection. Valid values are 64 hexadecimal characters (0-9, A-F). Requires cak_wo_version and either ckn or ckn_wo. Conflicts with cak and secret_arn. This value is not stored in the plan or state"
  type        = string
  default     = null
}
variable "dx_macsec_key_association_cak_wo_version" {
  description = "(Optional) Positive integer used to trigger replacement when cak_wo changes. Required with cak_wo. Increment this value to replace the association using the current write-only values"
  type        = number
  default     = null
}
variable  "dx_macsec_key_association_ckn" {
  description = "(Optional) MAC Security (MACsec) CKN to associate with the dedicated connection. Valid values are 64 hexadecimal characters (0-9, A-F). Required with cak or cak_wo unless ckn_wo is configured. Conflicts with ckn_wo. Changing this argument replaces the association"
  type        = string
  default     = null
}
variable  "dx_macsec_key_association_ckn_wo" {
  description = " (Optional) Write-only MAC Security (MACsec) CKN to associate with the dedicated connection. Valid values are 64 hexadecimal characters (0-9, A-F). Requires ckn_wo_version and either cak or cak_wo. Conflicts with ckn and secret_arn. This value is not stored in the plan or state"
  type        = string
  default     = null
}
variable "dx_macsec_key_association_ckn_wo_version" {
  description = "(Optional) Positive integer used to trigger replacement when ckn_wo changes. Required with ckn_wo. Increment this value to replace the association using the current write-only values"
  type        = number
  default     = null
}
variable "dx_macsec_key_association_connection_id" {
  description = "(Required) ID of the dedicated Direct Connect connection. The connection must be a dedicated connection in the AVAILABLE state"
  type        = string
}
variable "dx_macsec_key_association_secret_arn" {
  description = "(Optional) ARN of the MAC Security (MACsec) secret key to associate with the dedicated connection"
  type        = string
  default     = null
}
