variable "dynamodb_table_item_hash_key" {
  description = "Hash key to use for lookups and identification of the item"
  type        = string
}
variable "dynamodb_table_item_item" {
  description = "JSON representation of a map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required"
  type        = string
}
variable "dynamodb_table_item_range_key" {
  description = "Range key to use for lookups and identification of the item. Required if there is range key defined in the table"
  type        = string
  default     = null
}
variable "dynamodb_table_item_table_name" {
  description = "Name of the table to contain the item"
  type        = string
}
