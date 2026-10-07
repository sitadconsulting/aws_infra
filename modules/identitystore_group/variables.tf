variable "identitystore_group_description" {
  description = "A string containing the description of the group"
  type        = string
  default     = null
}
variable "identitystore_group_display_name" {
  description = "A string containing the name of the group. This value is commonly displayed when the group is referenced"
  type        = string
  default     = null
}
variable "identitystore_group_identity_store_id" {
  description = "The globally unique identifier for the identity store"
  type        = string
}
