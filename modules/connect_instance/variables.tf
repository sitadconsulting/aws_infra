variable "connect_instance_auto_resolve_best_voices_enabled" {
  description = "(Optional) Specifies whether auto resolve best voices is enabled. Defaults to true"
  type        = bool
  default     = null
}
variable "connect_instance_contact_flow_logs_enabled" {
  description = "(Optional) Specifies whether contact flow logs are enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "connect_instance_contact_lens_enabled" {
  description = "(Optional) Specifies whether contact lens is enabled. Defaults to true"
  type        = bool
  default     = true
}
variable "connect_instance_directory_id" {
  description = "(Optional) The identifier for the directory if identity_management_type is EXISTING_DIRECTORY"
  type        = string
  default     = null
}
variable "connect_instance_early_media_enabled" {
  description = "(Optional) Specifies whether early media for outbound calls is enabled . Defaults to true if outbound calls is enabled"
  type        = bool
  default     = null
}
variable "connect_instance_identity_management_type" {
  description = "(Required) Specifies the identity management type attached to the instance. Allowed Values are: SAML, CONNECT_MANAGED, EXISTING_DIRECTORY"
  type        = string
}
variable "connect_instance_inbound_calls_enabled" {
  description = "(Required) Specifies whether inbound calls are enabled"
  type        = bool
  default     = null
}
variable "connect_instance_instance_alias" {
  description = "(Optional) Specifies the name of the instance. Required if directory_id not specified"
  type        = string
  default     = null
}
variable "connect_instance_multi_party_conference_enabled" {
  description = "(Optional) Specifies whether multi-party calls/conference is enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "connect_instance_outbound_calls_enabled" {
  description = "(Required) Specifies whether outbound calls are enabled"
  type        = bool
}
variable "connect_instance_tags" {
  description = "(Optional) Tags to apply to the Instance"
  type        = map(string)
  default     = {}
}
