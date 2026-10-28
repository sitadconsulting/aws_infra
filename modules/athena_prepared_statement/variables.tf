variable "athena_prepared_statement_description" {
  description = "(Optional) Brief explanation of prepared statement. Maximum length of 1024"
  type        = string
  default     = null
}
variable "athena_prepared_statement_name" {
  description = "(Required) The name of the prepared statement. Maximum length of 256"
  type        = string
}
variable "athena_prepared_statement_query_statement" {
  description = "(Required) The query string for the prepared statement"
  type        = string
}
variable "athena_prepared_statement_workgroup" {
  description = "(Required) The name of the workgroup to which the prepared statement belongs"
  type        = string
}
