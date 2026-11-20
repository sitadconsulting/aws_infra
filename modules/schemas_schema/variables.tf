variable "schemas_schema_content" {
  description = "(Required) The schema specification. Must be a valid Open API 3.0 spec"
  type        = string
}
variable "schemas_schema_description" {
  description = "(Optional) The description of the schema. Maximum of 256 characters"
  type        = string
  default     = null
}
variable "schemas_schema_name" {
  description = "(Required) The name of the schema. Maximum of 385 characters consisting of lower case letters, upper case letters, ., -, _, @."
  type        = string
}
variable "schemas_schema_registry_name" {
  description = "(Required) The name of the registry in which this schema belongs"
  type        = string
}
variable "schemas_schema_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "schemas_schema_type" {
  description = "(Required) The type of the schema. Valid values: OpenApi3 or JSONSchemaDraft4"
  type        = string
}
