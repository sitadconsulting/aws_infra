variable "bcmdataexports_export_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "bcmdataexports_export_export" {
  description = "(Required) Details of the export, including data query, name, description, and destination configuration"
  type        = list(object({
    description                = optional(string)
    name                       = string
    data_query                 = list(object({
      query_statement      = string
      table_configurations = optional(map(string))
    }))
    destination_configurations = list(object({
      s3_destination = list(object({
        s3_bucket                = string 
        s3_bucket_owner          = optional(string)
        s3_prefix                = string
        s3_region                = string
        s3_output_configurations = list(object({
          compression = string
          format      = string
          output_type = string
          overwrite   = string
        }))
      }))
    }))
    refresh_cadence            = list(object({
      frequency = string 
    }))
  }))
}
