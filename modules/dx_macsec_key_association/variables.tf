variable "dx_macsec_key_association_cak" {
  description = "The MAC Security (MACsec) CAK to associate with the dedicated connection. The valid values are 64 hexadecimal characters (0-9, A-E). Required if using ckn"
  type        = string
  default     = null
}
variable  "dx_macsec_key_association_ckn" {
  description = "The MAC Security (MACsec) CKN to associate with the dedicated connection. The valid values are 64 hexadecimal characters (0-9, A-E). Required if using cak"
  type        = string
  default     = null
}
variable "dx_macsec_key_association_connection_id" {
  description = "The ID of the dedicated Direct Connect connection. The connection must be a dedicated connection in the AVAILABLE state"
  type        = string
}
variable "dx_macsec_key_association_secret_arn" {
  description = "The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key to associate with the dedicated connection"
  type        = string
  default     = null
}
