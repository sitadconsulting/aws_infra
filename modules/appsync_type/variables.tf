variable "appsync_type_api_id" {
  description = "(Required) GraphQL API ID"
  type        = string
}
variable "appsync_type_definition" {
  description = "(Required) Type definition"
  type        = string
}
variable "appsync_type_format" {
  description = "(Required) Type format: SDL or JSON"
  type        = string
}
