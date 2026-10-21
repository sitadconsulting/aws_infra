variable "lakeformation_opt_in_principal" {
  description = "(Required) Lake Formation principal. Supported principals are IAM users or IAM roles"
  type        = list(object({
    data_lake_principal_identifier = string
  }))
}
variable "lakeformation_opt_in_resource_data" {
  description = "(Required) Structure for the resource"
  type        = list(object({
    catalog            = optional(list(object({
      id = optional(string)
    })), [])
    data_cells_filter  = optional(list(object({
      database_name    = optional(string)
      name             = optional(string)
      table_catalog_id = optional(string)
      table_name       = optional(string)
    })), [])
    data_location      = optional(list(object({
      catalog_id   = optional(string)
      resource_arn = string
    })), [])
    database           = optional(list(object({
      catalog_id = optional(string)
      name       = string
    })), [])
    lf_tag             = optional(list(object({
      catalog_id = optional(string)
      key        = string
      values     = list(string)
    })), [])
    lf_tag_expression  = optional(list(object({
      catalog_id = optional(string)
      name       = string
    })), [])
    lf_tag_policy      = optional(list(object({
      catalog_id      = optional(string)
      expression      = optional(list(string))
      expression_name = optional(string)
      resource_type   = string
    })), [])
    table              = optional(list(object({
      catalog_id    = optiona(string)
      database_name = string
      name          = optional(string)
      wildcard      = optional(bool)
    })), [])
    table_with_columns = optional(list(object({
      catalog_id       = optional(string)
      column_names     = optional(list(string))
      database_name    = string
      name             = string
      column_wildcard  = optional(list(object({
        excluded_column_names = optional(list(string))
      })), [])
    })), [])
  }))
}
