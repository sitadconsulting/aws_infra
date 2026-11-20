variable "schemas_registry_description" {
  description = "(Optional) The description of the discoverer. Maximum of 256 characters"
  type        = string
  default     = null
}
variable "schemas_registry_name" {
  description = "(Required) The name of the custom event schema registry. Maximum of 64 characters consisting of lower case letters, upper case letters, 0-9, ., -, _."
  type        = string
}
variable "schemas_registry_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
