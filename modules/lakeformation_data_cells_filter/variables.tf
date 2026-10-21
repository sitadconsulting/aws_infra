variable "lakeformation_data_cells_filter_table_data" {
  description = "(Required) Information about the data cells filter"
  type        = list(object({
    database_name    = string
    name             = string
    table_catalog_id = string
    table_name       = string
    column_names     = optional(list(string))
    version_id       = optional(string)
  }))
}
variable "lakeformation_data_cells_filter_column_wildcard" {
  description = "(Optional) A wildcard with exclusions"
  type        = list(object({
    excluded_column_names = optional(list(string))
  }))
  default     = []
}
variable "lakeformation_data_cells_filter_row_filter" {
  description = "(Optional) A PartiQL predicate"
  type        = list(object({
    all_rows_wildcard = list(string)
    filter_expression = optional(string)
  }))
  default     = []
}
