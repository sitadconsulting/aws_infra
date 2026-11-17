variable "dynamodb_global_table_name" {
  description = "(Required) The name of the global table. Must match underlying DynamoDB Table names in all regions"
  type        = string
}
variable "dynamodb_global_table_replica" {
  description = "(Required) Underlying DynamoDB Table. At least 1 replica must be defined"
  type        = list(object({
    region_name = string
  }))
}
