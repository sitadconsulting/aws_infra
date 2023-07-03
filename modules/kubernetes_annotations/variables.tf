variable "annotations_api_version" {
  description = "The apiVersion of the resource to be annotated"
  type        = string
}
variable "annotations_kind" {
  description = "The kind of the resource to be annotated"
  type        = string
}
#variable "annotations_metadata_name" {
#  description = "Name of the resource to be annotated"
#  type        = string
#}
#variable "annotations_metadata_namespace" {
#  description = "Namespace of the resource to be annotated"
#  type        = string
#}
variable "annotations_annotations" {
  description = "A map of annotations to apply to the resource"
  type        = map(string)
  default     = {}
}
variable "annotations_template_annotations" {
  description = "A map of annotations to apply to the pod template within the resource"
  type        = map(string)
  default     = null
}
variable "annotations_force" {
  description = "Force management of annotations if there is a conflict"
  type        = bool
  default     = false
}
variable "annotations_field_manager" {
  description = "The name of the field manager. Defaults to Terraform"
  type        = string
  default     = "Terraform"
}
variable "annotations_metadata" {
  description = "Standard metadata of the resource to be annotated"
  type        = list(object({
    name      = string
    namespace = optional(string)
  }))
  default = []
}
