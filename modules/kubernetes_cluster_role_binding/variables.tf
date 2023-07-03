
variable "cluster_role_binding_metadata_annotations" {
  description = "An unstructured key value map stored with the Cluster Role Binding that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "cluster_role_binding_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the Cluster Role Binding"
  type        = map(string)
  default     = {}
}
variable "cluster_role_binding_metadata_name" {
  description = "Name of the Cluster Role Binding, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "cluster_role_binding_metadata_namespace" {
  description = "Namespace defines the space within which name of the Cluster Role Binding must be unique"
  type        = string
  default     = ""
}
variable "cluster_role_binding_role_ref_api_group" {
  description = "The API group to drive authorization decisions"
  type        = string
  default     = ""
}
variable "cluster_role_binding_role_ref_kind" {
  description = "The type of binding to use"
  type        = string
  default     = ""
}
variable "cluster_role_binding_role_ref_name" {
  description = "The name of this ClusterRole to bind Subjects to"
  type        = string
  default     = ""
}
variable "cluster_role_binding_subjects" {
  description = "A list of The Users, Groups, or ServiceAccounts to grant permissions to"
  type        = list(object({
    api_groups      = optional(string, "")
    kind            = string
    name            = string
    namespace       = optional(string, "")
  }))
  default      = []
}

