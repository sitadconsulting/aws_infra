variable "dynamodb_contributor_insights_index_name" {
  description = "(Optional) The global secondary index name"
  type        = string
  default     = null
}
variable "dynamodb_contributor_insights_table_name" {
  description = "(Required) The name of the table to enable contributor insights"
  type        = string
}
variable "dynamodb_contributor_insights_mode" {
  description = "(Optional) argument to specify the CloudWatch contributor insights mode"
  type        = string
  default     = null
}
