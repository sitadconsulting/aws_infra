variable "glue_catalog_allow_full_table_external_data_access" {
  description = "(Optional) Whether third-party engines can access data in Amazon S3 locations that are registered with Lake Formation. Valid values are True and False"
  type        = bool
  default     = null
}
variable "glue_catalog_description" {
  description = "(Optional) Description of the catalog"
  type        = string
  default     = null
}
variable "glue_catalog_name" {
  description = "(Required, Forces new resource) Name of the catalog"
  type        = string
}
variable "glue_catalog_overwrite_child_resource_permissions_with_default" {
  description = "(Optional) Whether to overwrite existing Lake Formation permissions on child resources with the default permissions. Valid values are Accept and Deny"
  type        = string
  default     = null
}
variable "glue_catalog_parameters" {
  description = "(Optional) Map of key-value pairs that define parameters and properties of the catalog"
  type        = map(string)
  default     = {}
}
variable "glue_catalog_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_catalog_catalog_properties" {
  description = "(Optional) Configuration block of properties for the catalog"
  type        = list(object({
    custom_properties               = optional(map(string))
    data_lake_access_properties     = optional(list(object({
      catalog_type       = optional(string)
      data_lake_access   = optional(bool)
      data_transfer_role = optional(string)
      kms_key            = optional(string)
    })), [])
    iceberg_optimization_properties = optional(list(object({
      compaction           = optional(map(string))
      orphan_file_deletion = optional(map(string))
      retention            = optional(map(string))
      role_arn             = optional(string)
    })), [])
  }))
  default     = []
}
variable "glue_catalog_create_database_default_permissions" {
  description = "(Optional) List of default permissions on databases for principals"
  type        = list(object({
    permissions = optional(string)
    principal   = optional(list(object({
      data_lake_principal_identifier = optional(string)
    })), [])
  }))
  default     = []
}
variable "glue_catalog_create_table_default_permissions" {
  description = "(Optional) List of default permissions on tables for principals"
  type        = list(object({
    permissions = optional(string)
    principal   = optional(list(object({
      data_lake_principal_identifier = optional(string)
    })), [])
  }))
  default     = []
}
variable "glue_catalog_federated_catalog" {
  description = "(Optional) Configuration block for a federated catalog"
  type        = list(object({
    connection_name = optional(string)
    connection_type = optional(string)
    identifier      = optional(string)
  }))
  default     = []
}
variable "glue_catalog_target_redshift_catalog" {
  description = "(Optional) Configuration block for a target Redshift catalog"
  type        = list(object({
    catalog_arn = string
  }))
  default     = []
}
