variable "namespace_annotations" {
  description = "An unstructured key value map stored with the Namespace that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "namespace_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the Namespace"
  type        = map(string)
  default     = {}
}
variable "namespace_name" {
  description = "Name of the Namespace, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
