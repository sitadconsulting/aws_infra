variable "datazone_asset_type_description" {
  description = "(Optional) The description of the custom asset type"
  type        = string
  default     = null
}
variable "datazone_asset_type_domain_identifier" {
  description = "(Required) The unique identifier of the Amazon DataZone domain where the custom asset type is being created"
  type        = string
}
variable "datazone_asset_type_name" {
  description = "(Required) The name of the custom asset type"
  type        = string
}
variable "datazone_asset_type_owning_project_identifier" {
  description = "(Required) The unique identifier of the Amazon DataZone project that owns the custom asset type"
  type        = string
}
variable "datazone_asset_type_forms_input" {
  description = "(Optional) The metadata forms that are to be attached to the custom asset type"
  type        = list(object({
    map_block_key   = string
    type_identifier = string
    type_revision   = string
    required        = optional(bool)
  }))
  default     = []
}
