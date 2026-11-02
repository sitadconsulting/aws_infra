variable "cloudwatch_query_definition_log_group_names" {
  description = "(Optional) Specific log groups to use with the query"
  type        = list(string)
  default     = null
}
variable "cloudwatch_query_definition_name" {
  description = "(Required) The name of the query"
  type        = string
}
variable "cloudwatch_query_definition_query_string" {
  description = "(Required) The query to save"
  type        = string
}
