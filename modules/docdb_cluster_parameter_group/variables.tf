variable "docdb_cluster_parameter_group_description" {
  description = "(Optional, Forces new resource) The description of the DocumentDB cluster parameter group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = null
}
variable "docdb_cluster_parameter_group_family" {
  description = "(Required, Forces new resource) The family of the DocumentDB cluster parameter group"
  type        = string
}
variable "docdb_cluster_parameter_group_name" {
  description = "(Optional, Forces new resource) The name of the DocumentDB cluster parameter group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "docdb_cluster_parameter_group_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "docdb_cluster_parameter_group_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "docdb_cluster_parameter_group_parameter" {
  description = "(Optional) A list of DocumentDB parameters to apply. Setting parameters to system default values may show a difference on imported resources"
  type        = list(object({
    name         = string
    value        = string
    apply_method = optional(string)
  }))
  default     = []
}
