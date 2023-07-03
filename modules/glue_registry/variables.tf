variable "glue_registry_description" {
  description = "A description of the registry"
  type        = string
  default     = ""
}
variable "glue_registry_registry_name" {
  description = "The Name of the registry"
  type        = string
}
variable "glue_registry_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
