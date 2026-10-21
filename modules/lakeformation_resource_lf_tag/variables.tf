variable "lakeformation_resource_lf_tag_catalog_id" {
  description = "(Optional) Identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent metadata store. It contains database definitions, table definitions, and other control information to manage your Lake Formation environment"
  type        = string
  default     = null
}
variable "lakeformation_resource_lf_tag_lf_tag" {
  description = "(Required) Set of LF-tags to attach to the resource"
  type        = list(object({
    catalog_id = optional(string)
    key        = string
    value      = string
  }))
}
variable "lakeformation_resource_lf_tag_database" {
  description = "(Optional) Configuration block for a database resource"
  type        = list(object({
    catalog_id = optional(string)
    name       = string
  }))
  default     = []
}
variable "lakeformation_resource_lf_tag_table" {
  description = "(Optional) Configuration block for a table resource"
  type        = list(object({
    catalog_id    = optional(string)
    database_name = string
    name          = optional(string)
    wildcard      = optional(bool)
  }))
  default     = []
}
variable "lakeformation_resource_lf_tag_table_with_columns" {
  description = "(Optional) Configuration block for a table with columns resource"
  type        = list(object({
    catalog_id      = optional(string)
    column_names    = optional(list(string))
    database_name   = string
    name            = string
    column_wildcard = optional(list(object({
      excluded_column_names = optional(list(string))
    })), [])
  }))
  default     = []
}
