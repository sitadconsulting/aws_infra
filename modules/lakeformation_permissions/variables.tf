variable "lakeformation_permissions_permissions" {
  description = "(Required) List of permissions granted to the principal. Valid values may include ALL, ALTER, ASSOCIATE, CREATE_DATABASE, CREATE_TABLE, DATA_LOCATION_ACCESS, DELETE, DESCRIBE, DROP, INSERT, and SELECT. For details on each permission"
  type        = list(string)
}
variable "lakeformation_permissions_principal" {
  description = "(Required) Principal to be granted the permissions on the resource. Supported principals include IAM_ALLOWED_PRINCIPALS, IAM roles, users, groups, Federated Users, SAML groups and users, QuickSight groups, OUs, and organizations as well as AWS account IDs for cross-account permissions"
  type        = string
}
variable "lakeformation_permissions_catalog_resource" {
  description = "(Optional) Whether the permissions are to be granted for the Data Catalog. Defaults to false"
  type        = bool
  default     = null
}
variable "lakeformation_permissions_catalog_id" {
  description = "(Optional) Identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent metadata store. It contains database definitions, table definitions, and other control information to manage your Lake Formation environment"
  type        = string
  default     = null
}
variable "lakeformation_permissions_permissions_with_grant_option" {
  description = "(Optional) Subset of permissions which the principal can pass"
  type        = list(string)
  default     = []
}
variable "lakeformation_permissions_data_cells_filter" {
  description = "(Optional) Configuration block for a data cells filter resource"
  type        = list(object({
    database_name    = string
    name             = string
    table_catalog_id = string
    table_name       = string
  }))
  default     = []
}
variable "lakeformation_permissions_data_location" {
  description = "(Optional) Configuration block for a data location resource"
  type        = list(object({
    arn        = string
    catalog_id = optional(string)
  }))
  default     = []
}
variable "lakeformation_permissions_database" {
  description = "(Optional) Configuration block for a database resource"
  type        = list(object({
    catalog_id  = optional(string)
    name        = string
  }))
  default     = []
}
variable "lakeformation_permissions_lf_tag" {
  description = "(Optional) Configuration block for an LF-tag resource"
  type        = list(object({
    catalog_id = optional(string)
    key        = string
    values     = list(string)
  }))
  default     = []
}
variable "lakeformation_permissions_lf_tag_policy" {
  description = "(Optional) Configuration block for an LF-tag policy resource"
  type        = list(object({
    catalog_id    = optional(string)
    resource_type = string
    expression    = optional(list(object({
      key    = string
      values = list(string)
    })), [])
  }))
  default     = []
}
variable "lakeformation_permissions_table" {
  description = "(Optional) Configuration block for a table resource"
  type        = list(object({
    catalog_id    = optional(string)
    database_name = string
    name          = optional(string)
    wildcard      = optional(bool)
  }))
  default     = []
}
variable "lakeformation_permissions_table_with_columns" {
  description = "(Optional) Configuration block for a table with columns resource"
  type        = list(object({
    catalog_id            = optional(string)
    column_names          = optional(list(string))
    database_name         = string
    excluded_column_names = optional(list(string))
    name                  = string
    wildcard              = optional(bool)
  }))
  default     = []
}
