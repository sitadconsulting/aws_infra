variable "dynamodb_global_table_name" {
  description = "The name of the global table. Must match underlying DynamoDB Table names in all regions"
  type        = string
}
variable "dynamodb_global_table_replica" {
  description = "Underlying DynamoDB Table"
  type        = list(object({
    region_name = string
  }))
  default     = []
}
