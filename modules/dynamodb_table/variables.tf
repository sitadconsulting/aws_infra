variable "dynamodb_table_billing_mode" {
  description = "(Optional) Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED"
  type        = string
  default     = "PROVISIONED"
}
variable "dynamodb_table_deletion_protection_enabled" {
  description = "(Optional) Enables deletion protection for table. Defaults to false"
  type        = bool
  default     = false
}
variable "dynamodb_table_hash_key" {
  description = "(Required, Forces new resource) Attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
}
variable "dynamodb_table_name" {
  description = "(Required) Unique within a region name of the table"
  type        = string
}
variable "dynamodb_table_range_key" {
  description = "(Optional, Forces new resource) Attribute to use as the range (sort) key. Must also be defined as an attribute"
  type        = string
  default     = null
}
variable "dynamodb_table_read_capacity" {
  description = "(Optional) Number of read units for this table. If the billing_mode is PROVISIONED, this field is required"
  type        = number
  default     = null
}
variable "dynamodb_table_restore_backup_arn" {
  description = "(Optional) ARN of backup to restore"
  type        = string
  default     = null
} 
variable "dynamodb_table_restore_date_time" {
  description = "(Optional) Time of the point-in-time recovery point to restore"
  type        = string
  default     = null
}
variable "dynamodb_table_restore_source_name" {
  description = "(Optional) Name of the table to restore. Must match the name of an existing table"
  type        = string
  default     = null
}
variable "dynamodb_table_restore_source_table_arn" {
  description = "(Optional) ARN of the source table to restore. Must be supplied for cross-region restores"
  type        = string
  default     = null
}
variable "dynamodb_table_restore_to_latest_time" {
  description = "(Optional) If set, restores table to the most recent point-in-time recovery point"
  type        = bool
  default     = true
}
variable "dynamodb_table_stream_enabled" {
  description = "(Optional) Whether Streams are enabled"
  type        = bool
  default     = false
}
variable "dynamodb_table_stream_view_type" {
  description = "(Optional) When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES. Only valid when stream_enabled is true"
  type        = string
  default     = null
}
variable "dynamodb_table_table_class" {
  description = "(Optional) Storage class of the table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS. Default value is STANDARD"
  type        = string
  default     = "STANDARD"
}
variable "dynamodb_table_tags" {
  description = "(Optional) A map of tags to populate on the created table"
  type        = map(string)
  default     = {}
}
variable "dynamodb_table_write_capacity" {
  description = "(Optional) Number of write units for this table. If the billing_mode is PROVISIONED, this field is required"
  type        = number
  default     = null
}
variable "dynamodb_table_attribute" {
  description = "(Required) Set of nested attribute definitions. Only required for hash_key and range_key attributes"
  type        = list(object({
    name  = string
    type  = string
  }))
}
variable "dynamodb_table_import_table" {
  description = "(Optional) Import Amazon S3 data into a new table"
  type        = list(object({
    input_compression_type = optional(string)
    input_format           = string
    input_format_options   = optional(list(object({
      csv = optional(list(object({
        delimiter   = optional(string)
        header_list = optional(list(string))
      })), [])
    })), [])
    s3_bucket_source       = list(object({
      bucket       = string
      bucket_owner = optional(string)
      key_prefix   = optional(string)
    }))
  }))
  default     = []
}
variable "dynamodb_table_global_secondary_index" {
  description = "(Optional) Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc"
  type        = list(object({
    hash_key           = string
    name               = string
    non_key_attributes = optional(list(string))
    projection_type    = string
    range_key          = optional(string)
    read_capacity      = optional(number)
    write_capacity     = optional(number)
    key_schema         = optional(list(object({
      attribute_name = string
      key_type       = string
    })), [])
    on_demand_throughput = optional(list(object({
      max_read_request_units  = optional(number)
      max_write_request_units = optional(number)
    })), [])
    warm_throughput      = optional(list(object({
      read_units_per_second  = optional(number)
      write_units_per_second = optional(number) 
    })), [])
  }))
  default    = []
}
variable "dynamodb_table_global_table_witness" {
  description = "(Optional) Witness Region in a Multi-Region Strong Consistency deployment. Note This must be used alongside a single replica with consistency_mode set to STRONG. Other combinations will fail to provision"
  type        = list(object({
    region_name = optional(string)
  }))
  default     = []
}
variable "dynamodb_table_local_secondary_index" {
  description = "(Optional, Forces new resource) Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource"
  type        = list(object({
    name               = string
    non_key_attributes = optional(list(string))
    projection_type    = string
    range_key          = string
  }))
  default    = []
}
variable "dynamodb_table_on_demand_throughput" {
  description = "(Optional) Sets the maximum number of read and write units for the specified on-demand table"
  type        = list(object({
    max_read_request_units  = optional(number)
    max_write_request_units = optional(number)
  }))
  default     = []
}
variable "dynamodb_table_point_in_time_recovery" {
  description = "(Optional) Enable point-in-time recovery options"
  type        = list(object({
    enabled                 = bool
    recovery_period_in_days = optional(number)
  }))
  default     = [] 
}
variable "dynamodb_table_replica" {
  description = "(Optional) Configuration block(s) with DynamoDB Global Tables V2 (version 2019.11.21) replication configurations"
  type        = list(object({
    consistency_mode            = optional(string)
    kms_key_arn                 = optional(string)
    point_in_time_recovery      = optional(bool, false)
    deletion_protection_enabled = optional(bool, false)
    propagation_tags            = optional(bool, false)
    region_name                 = string
  }))
  default    = [] 
}
variable "dynamodb_table_server_side_encryption" {
  description = "(Optional) Encryption at rest options. AWS DynamoDB tables are automatically encrypted at rest with an AWS-owned Customer Master Key if this argument isn't specified. Must be supplied for cross-region restores"
  type        = list(object({
    enabled     = bool
    kms_key_arn = optional(string)
  }))
  default     = []
}
variable "dynamodb_table_ttl" {
  description = "(Optional) Configuration block for TTL"
  type        = list(object({
    attribute_name = string
    enabled        = optional(bool, false)
  }))
  default     = []
}
variable "dynamodb_table_warm_throughput" {
  description = "(Optional) Sets the number of warm read and write units for the specified table"
  type        = list(object({
    read_units_per_second  = optional(number)
    write_units_per_second = optional(number) 
  }))
  default     = []
}
