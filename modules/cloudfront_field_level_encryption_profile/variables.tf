variable "cloudfront_field_level_encryption_profile_comment" {
  description = "(Optional) An optional comment about the Field Level Encryption Profile"
  type        = string
  default     = null
}
variable "cloudfront_field_level_encryption_profile_name" {
  description = "(Required) The name of the Field Level Encryption Profile"
  type        = string
}
variable "cloudfront_field_level_encryption_profile_encryption_entities" {
  description = "(Required) The encryption entities config block for field-level encryption profiles that contains an attribute items which includes the encryption key and field pattern specifications"
  type        = list(object({
    public_key_id  = list(string)
    provider_id    = string
    field_patterns = string
  }))
}
