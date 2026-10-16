variable "glue_catalog_table_optimizer_catalog_id" {
  description = "(Required) The Catalog ID of the table"
  type        = string
}
variable "glue_catalog_table_optimizer_database_name" {
  description = "(Required) The name of the database in the catalog in which the table resides"
  type        = string
}
variable "glue_catalog_table_optimizer_table_name" {
  description = "(Required) The name of the table"
  type        = string
}
variable "glue_catalog_table_optimizer_type" {
  description = "(Required) The type of table optimizer. Valid values are compaction, retention, and orphan_file_deletion"
  type        = string
}
variable "glue_catalog_table_optimizer_configuration" {
  description = "(Required) A configuration block that defines the table optimizer settings"
  type        = list(object({
    enabled                            = bool 
    role_arn                           = string
    orphan_file_deletion_configuration = optional(list(object({
      iceberg_configuration = optional(list(object({
        location                             = optional(string)
        orphan_file_retention_period_in_days = optional(number)
        run_rate_in_hours                    = optional(number)
      })), []) 
    })), [])
    retention_configuration            = optional(list(object({
      iceberg_configuration = optional(list(object({
        clean_expired_files               = optional(bool)
        number_of_snapshots_to_retain     = optional(number)
        run_rate_in_hours                 = optional(number)
        snapshot_retention_period_in_days = optional(number)
      })), [])
    })), [])
    compaction_configuration           = optional(list(object({
      iceberg_configuration = optional(list(object({
        strategy              = optional(string)
        min_input_files       = optional(number)
        delete_file_threshold = optional(number)
      })), [])
    })), [])
  }))
}
