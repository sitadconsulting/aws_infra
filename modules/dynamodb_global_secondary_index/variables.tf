variable "dynamodb_global_secondary_index_index_name" {
  description = "(Required) Name of the index"
  type        = string
}
variable "dynamodb_global_secondary_index_table_name" {
  description = "(Required) Name of the table this index belongs to"
  type        = string
}
variable "dynamodb_global_secondary_index_key_schema" {
  description = "(Required) Set of nested attribute definitions. At least 1 element defining a HASH is required. All elements with the key_type of HASH must precede elements with key_type of RANGE. Changing any values in key_schema will re-create the resource"
  type        = list(object({
    attribute_name = string
    attribute_type = string
    key_type       = string
  }))
}
variable "dynamodb_global_secondary_index_on_demand_throughput" {
  description = "(Optional) Sets the maximum number of read and write units for the index. Only valid if the table's billing_mode is PAY_PER_REQUEST"
  type        = list(object({
    max_read_request_units  = optional(number)
    max_write_request_units = optional(number)
  }))
  default     = []
}
variable "dynamodb_global_secondary_index_projection" {
  description = "(Required) Describes which attributes from the table are represented in the index"
  type        = list(object({
    non_key_attributes = optional(list(string))
    projection_type    = string
  }))
}
variable "dynamodb_global_secondary_index_provisioned_throughput" {
  description = "(Optional) Provisioned throughput for the index. Required if the table's billing_mode is PROVISIONED"
  type        = list(object({
    read_capacity_units  = optional(number)
    write_capacity_units = optional(number)
  }))
  default     = []
}
variable "dynamodb_global_secondary_index_warm_throughput" {
  description = "(Optional) Sets the number of warm read and write units for this index"
  type        = list(object({
    read_units_per_second  = number
    write_units_per_second = number
  }))
  default     = []
}
