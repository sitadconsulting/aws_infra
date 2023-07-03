variable "cluster_role_metadata_annotations" {
  description = "An unstructured key value map stored with the Cluster Role that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "cluster_role_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the Cluster Role"
  type        = map(string)
  default     = {}
}
variable "cluster_role_metadata_name" {
  description = "Name of the Cluster Role, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "cluster_role_rules" {
  description = "A list of Policy Rules for this ClusterRole "
  type        = list(object({
    api_groups      = optional(list(string), [])
    resources       = optional(list(string), [])
    verbs           = list(string)
  }))
  default      = []
}
