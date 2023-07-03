variable "glue_partition_catalog_id" {
  description = "ID of the Glue Catalog and database to create the table in. If omitted, this defaults to the AWS Account ID plus the database name"
  type        = string
  default     = ""
}
variable "glue_partition_database_name" {
  description = "Name of the metadata database where the table metadata resides. For Hive compatibility, this must be all lowercase"
  type        = string
}
variable "glue_partition_table_name" {
  description = "Name of the table"
  type        = string
}
variable "glue_partition_partition_values" {
  description = "The values that define the partition"
  type        = list(string)
}
variable "glue_partition_parameters" {
  description = "Properties associated with this table, as a list of key-value pairs"
  type        = map(string)
  default     = {}
}
variable "glue_partition_storage_descriptor" {
  description = "A storage descriptor object containing information about the physical storage of this table"
  type        = list(object({
    bucket_columns            = optional(list(string))
    compressed                = optional(bool)
    input_format              = optional(string)
    location                  = optional(string)
    number_of_buckets         = optional(number)
    output_format             = optional(string)
    parameters                = optional(map(string))
    stored_as_sub_directories = optional(bool)
    columns = optional(list(object({
      comment = optional(string)
      name    = string
      type    = optional(string)
    })))
    ser_de_info = optional(list(object({
      name                  = optional(string)
      parameters            = optional(map(string))
      serialization_library = optional(string)
    })))
    skewed_info = optional(list(object({
      skewed_column_names               = optional(list(string))
      skewed_column_values              = optional(list(string))
      skewed_column_value_location_maps = optional(map(string))
    })))
    sort_columns = optional(list(object({
      column     = string
      sort_order = number
    })))
  }))
  default     = []
}

