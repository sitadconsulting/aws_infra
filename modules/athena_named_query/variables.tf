variable "athena_named_query_database" {
  description = "(Required) Database to which the query belongs"
  type        = string
}
variable "athena_named_query_description" {
  description = "(Optional) Brief explanation of the query. Maximum length of 1024"
  type        = string
  default     = null
}
variable "athena_named_query_name" {
  description = "(Required) Plain language name for the query. Maximum length of 128"
  type        = string
}
variable "athena_named_query_query" {
  description = "(Required) Text of the query itself. In other words, all query statements. Maximum length of 262144"
  type        = string
}
variable "athena_named_query_workgroup" {
  description = "(Optional) Workgroup to which the query belongs. Defaults to primary"
  type        = string
  default     = null
}
