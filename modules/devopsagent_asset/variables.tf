variable "devopsagent_asset_agent_space_id" {
  description = "(Required) Identifier of the Agent Space containing the asset. Changing this value requires replacement"
  type        = string
}
variable "devopsagent_asset_asset_type" {
  description = "(Required) Type of asset. Changing this value requires replacement"
  type        = string
}
variable "devopsagent_asset_metadata" {
  description = "(Optional) JSON document describing the asset. Required metadata fields depend on asset_type. Updates replace supplied top-level fields and retain omitted fields in AWS; removing a field from this document does not delete it from AWS. Changes to metadata alone do not re-upload content"
  type        = string
  default     = null
}
variable "devopsagent_asset_content" {
  description = "(Required) Content to upload. Exactly one block is required"
  type        = list(object({
    file       = optional(list(object({
      metadata = optional(string)
      path     = string
      body     = list(object({
        bytes = optional(string)
        text  = optional(string)
      }))
    })), [])
    source_url = optional(list(object({
      url = string 
    })), [])
    zip        = optional(list(object({
      zip_file = string 
    })), [])
  }))
}
