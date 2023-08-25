variable "dynamodb_table_billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED"
  type        = string
  default     = "PROVISIONED"
}
variable "dynamodb_table_deletion_protection_enabled" {
  description = "Whether to enables deletion protection for table. Defaults to false"
  type        = bool
  default     = false
}
variable "dynamodb_table_hash_key" {
  description = "Attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  default     = null
}
variable "dynamodb_table_name" {
  description = "Name of the table. Must be unique within a region"
  type        = string
}
variable "dynamodb_table_range_key" {
  description = "Attribute to use as the range (sort) key. Must also be defined as an attribute"
  type        = string
  default     = null
}
variable "dynamodb_table_read_capacity" {
  description = "Number of read units for this table. If the billing_mode is PROVISIONED, this field is required"
  type        = number
  default     = null
}
variable "dynamodb_table_restore_date_time" {
  description = "Time of the point-in-time recovery point to restore"
  type        = string
  default     = null
}
variable "dynamodb_table_restore_source_name" {
  description = "Name of the table to restore. Must match the name of an existing table"
  type        = string
  default     = null
}
variable "dynamodb_table_restore_to_latest_time" {
  description = "If set, restores table to the most recent point-in-time recovery point"
  type        = bool
  default     = true
}
variable "dynamodb_table_stream_enabled" {
  description = "Whether Streams are enabled"
  type        = bool
  default     = false
}
variable "dynamodb_table_stream_view_type" {
  description = "When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES"
  type        = string
  default     = null
}
variable "dynamodb_table_table_class" {
  description = "Storage class of the table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS. Default value is STANDARD"
  type        = string
  default     = "STANDARD"
}
variable "dynamodb_table_tags" {
  description = "A map of tags to populate on the created table"
  type        =map(string)
  default     = {}
}
variable "dynamodb_table_write_capacity" {
  description = "Number of write units for this table. If the billing_mode is PROVISIONED"
  type        = number
  default     = null
}
variable "dynamodb_table_attribute" {
  description = " "
  type        = list(object({
    name  = string
    type  = string
  }))
  default = []
}
variable "dynamodb_table_global_secondary_index" {
  description = "Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc"
  type        = list(object({
    hash_key           = string
    name               = string
    non_key_attributes = optional(list(string))
    projection_type    = string
    range_key          = optional(string)
    read_capacity      = optional(number)
    write_capacity     = optional(number)
  }))
  default    = []
}
variable "dynamodb_table_local_secondary_index" {
  description = "Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource"
  type        = list(object({
    name               = string
    non_key_attributes = optional(list(string))
    projection_type    = string
    range_key          = string
  }))
  default    = []
}
variable "dynamodb_table_point_in_time_recovery" {
  description = "Enable point-in-time recovery options"
  type        = list(object({
    enabled   = bool
  }))
  default     = [] 
}
variable "dynamodb_table_replica" {
  description = "functions as a part of a global table"
  type        = list(object({
    kms_key_arn            = optional(string)
    point_in_time_recovery = optional(bool, false)
    propagation_tags       = optional(bool, false)
    region_name            = string
  }))
  default    = [] 
}
variable "dynamodb_table_server_side_encryption" {
  description = "Encryption at rest options. AWS DynamoDB tables are automatically encrypted at rest with an AWS-owned Customer Master Key if this argument isn't specified"
  type        = list(object({
    enabled     = bool
    kms_key_arn = optional(string)
  }))
  default     = []
}
variable "dynamodb_table_ttl" {
  description = "per-item timestamp to determine when an item is no longer needed"
  type        = list(object({
    attribute_name = string
    enabled        = optional(bool, false)
  }))
  default     = []
}
