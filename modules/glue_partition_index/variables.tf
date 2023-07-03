variable "glue_partition_index_catalog_id" {
  description = "The catalog ID where the table resides"
  type        = string
  default     = ""
}
variable "glue_partition_index_database_name" {
  description = "Name of the metadata database where the table metadata resides. For Hive compatibility, this must be all lowercase"
  type        = string
}
variable "glue_partition_index_table_name" {
  description = "Name of the table. For Hive compatibility, this must be entirely lowercase"
  type        = string
}
variable "glue_partition_index_partition_index" {
  description = "Configuration for partition index"
  type        = list(object({
    index_name = optional(string)
    keys       = optional(list(string))
  }))
  default     = []
}
