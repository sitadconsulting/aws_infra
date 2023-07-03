variable "athena_named_query_database" {
  description = "Database to which the query belongs"
  type        = string
}
variable "athena_named_query_description" {
  description = "Brief explanation of the query. Maximum length of 1024"
  type        = string
  default     = ""
}
variable "athena_named_query_name" {
  description = "Plain language name for the query. Maximum length of 128"
  type        = string
}
variable "athena_named_query_query" {
  description = "Text of the query itself. In other words, all query statements. Maximum length of 262144"
  type        = string
}
variable "athena_named_query_workgroup" {
  description = "Workgroup to which the query belongs. Defaults to primary"
  type        = string
  default     = ""
}
