variable "dynamodb_contributor_insights_index_name" {
  description = "The global secondary index name"
  type        = string
  default     = null
}
variable "dynamodb_contributor_insights_table_name" {
  description = "The name of the table to enable contributor insights"
  type        = string
}
