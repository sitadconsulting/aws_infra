variable "ingress_class_metadata_annotations" {
  description = "An unstructured key value map stored with the Ingress Class that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "ingress_class_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the Ingress Class"
  type        = map(string)
  default     = {}
}
variable "ingress_class_metadata_name" {
  description = "Name of the Ingress Class, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "ingress_class_spec_controller" {
  description = "The name of the controller that should handle this class "
  type        = string
  default     = ""
}
variable "ingress_class_spec_parameters" {
  description = "The name of the controller that should handle this class "
  type        = list(object({
   api_group = optional(string)
   kind      = string
   name      = optional(string)
   namespace = optional(string)
   scope     = optional(string) 
  }))
  default     = []
}
