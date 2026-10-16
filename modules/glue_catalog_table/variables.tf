variable "glue_catalog_table_catalog_id" {
  description = "ID of the Glue Catalog and database to create the table in. If omitted, this defaults to the AWS Account ID plus the database name"
  type        = string
  default     = null
}
variable "glue_catalog_table_description" {
  description = "Description of the table"
  type        = string
  default     = null
}
variable "glue_catalog_table_database_name" {
  description = "Name of the metadata database where the table metadata resides. For Hive compatibility, this must be all lowercase"
  type        = string
}
variable "glue_catalog_table_name" {
  description = "Name of the table. For Hive compatibility, this must be entirely lowercase"
  type        = string
  default     = null
}
variable "glue_catalog_table_owner" {
  description = "Owner of the table"
  type        = string
  default     = null
}
variable "glue_catalog_table_parameters" {
  description = "Properties associated with this table, as a list of key-value pairs"
  type        = map(string)
  default     = {}
}
variable "glue_catalog_table_retention" {
  description = "Retention time for this table"
  type        = number
  default     = null
}
variable "glue_catalog_table_table_type" {
  description = "Type of this table (EXTERNAL_TABLE, VIRTUAL_VIEW, etc.). While optional, some Athena DDL queries such as ALTER TABLE and SHOW CREATE TABLE will fail if this argument is empty"
  type        = string
  default     = null
}
variable "glue_catalog_table_view_expanded_text" {
  description = "If the table is a view, the expanded text of the view; otherwise null"
  type        = string
  default     = null
}
variable "glue_catalog_table_view_original_text" {
  description = "If the table is a view, the original text of the view; otherwise null"
  type        = string
  default     = null
}
variable "glue_catalog_table_open_table_format_input" {
  description = "(Optional) Configuration block for open table formats"
  type        = list(object({
    iceberg_input = list(object({
      metadata_operation  = string
      version             = optional(string)
      iceberg_table_input = optional(list(object({
        location   = string
        properties = optional(map(string))
        partition_spec = optional(list(object({
          spec_id = optional(string)
          fields  = list(object({
            field_id  = optional(string)
            name      = string
            source_id = string
            transform = string
          }))
        })), [])
        schema         = list(object({
          identifier_field_ids = optional(list(string))
          schema_id            = optional(string)
          type                 = optional(string)
          fields               = list(object({
            doc             = optional(string)
            id              = string
            initial_default = optional(string)
            name            = string
            required        = bool
            type            = string
            write_default   = optional(string)
          }))
        }))
        sort_order     = optional(list(object({
          order_id  = string
          fields    = list(object({
            direction  = string
            null_order = string
            source_id  = string
            transform  = string
          }))
        })), [])
      })), [])
    }))
  }))
  default     = []
}
variable "glue_catalog_table_partition_index" {
  description = "Configuration for a maximum of 3 partition indexes"
  type        = list(object({
    index_name = optional(string)
    keys       = optional(list(string))
  }))
  default     = []
}
variable "glue_catalog_table_partition_keys" {
  description = "Configuration of columns by which the table is partitioned. Only primitive types are supported as partition keys"
  type        = list(object({
    comment    = optional(string)
    name       = string
    parameters = optional(map(string))
    type       = optional(string)
  }))
  default     = []
}
variable "glue_catalog_table_storage_descriptor" {
  description = "Configuration for information about the physical storage of this table"
  type        = list(object({
    additional_locations      = optional(list(string))
    bucket_columns            = optional(list(string))
    compressed                = optional(bool)
    input_format              = optional(string)
    location                  = optional(string)
    number_of_buckets         = optional(number)
    output_format             = optional(string)
    parameters                = optional(map(string))
    stored_as_sub_directories = optional(bool)
    columns        = optional(list(object({
      comment    = optional(string)
      name       = string
      parameters = optional(map(string))
      type       = optional(string)
    })), [])
    schema_reference = optional(list(object({
      schema_version_id     = optional(string)
      schema_version_number = number
      schema_id             = optional(list(object({
        registry_name = optional(string)
        schema_arn    = optional(string)
        schema_name   = optional(string)
      })), [])
    })), [])
    ser_de_info = optional(list(object({
      name                  = optional(string)
      parameters            = optional(map(string))
      serialization_library = optional(string) 
    })), [])
    skewed_info = optional(list(object({
      skewed_column_names               = optional(list(string))
      skewed_column_values              = optional(list(string))
      skewed_column_value_location_maps = optional(map(string)) 
    })), [])
    sort_columns = optional(list(object({
      column     = string
      sort_order = number
    })), [])
  }))
  default     = []
}
variable "glue_catalog_table_target_table" {
  description = "Configuration of a target table for resource linking"
  type        = list(object({
    catalog_id    = string
    database_name = string
    name          = string 
    region        = optional(string)
  }))
  default     = []
}
variable "glue_catalog_table_view_definition" {
  description = "(Optional) Structure that contains all the information that defines the view, including the dialect or dialects for the view, and the query"
  type        = list(object({
    definer                = optional(string)
    is_protected           = optional(bool)
    last_refresh_type      = optional(string)
    refresh_seconds        = optional(number)
    sub_object_version_ids = optional(list(string))
    sub_objects            = optional(list(string))
    view_version_id        = optional(string)
    view_version_token     = optional(string)
    representations        = optional(list(object({
      dialect               = optional(string)
      dialect_version       = optional(string)
      validation_connection = optional(string)
      view_expanded_text    = optional(string)
      view_original_text    = optional(string)
    })), [])
  }))
  default     = []
}
