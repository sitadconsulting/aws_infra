variable "glue_catalog_database_catalog_id" {
  description = "ID of the Glue Catalog to create the database in. If omitted, this defaults to the AWS Account ID"
  type        = string
  default     = ""
}
variable "glue_catalog_database_description" {
  description = "Description of the database"
  type        = string
  default     = ""
}
variable "glue_catalog_database_location_uri" {
  description = "Location of the database (for example, an HDFS path)"
  type        = string
  default     = ""
}
variable "glue_catalog_database_name" {
  description = "Name of the database. The acceptable characters are lowercase letters, numbers, and the underscore character"
  type        = string
}
variable "glue_catalog_database_parameters" {
  description = "List of key-value pairs that define parameters and properties of the database"
  type        = list(string)
  default     = []
}
variable "glue_catalog_database_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_catalog_database_create_table_default_permission" {
  description = "Creates a set of default permissions on the table for principals"
  type        = list(object({
    permissions = optional(list(string))
    principal   = optional(list(object({
      data_lake_principal_identifier = optional(string)
    })))
  }))
  default     = []
}
variable "glue_catalog_database_target_database" {
  description = "Configuration for a target database for resource linking "
  type        = list(object({
    catalog_id    = string
    database_name = string 
  }))
  default     = []
}
