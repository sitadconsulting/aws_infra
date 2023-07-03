variable "cloudwatch_query_definition_log_group_names" {
  description = "Specific log groups to use with the query"
  type        = list(string)
  default     = []
}
variable "cloudwatch_query_definition_name" {
  description = "The name of the query"
  type        = string
}
variable "cloudwatch_query_definition_query_string" {
  description = "The query to save"
  type        = string
}
