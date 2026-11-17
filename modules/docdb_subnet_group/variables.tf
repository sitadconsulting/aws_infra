variable "docdb_subnet_group_description" {
  description = "(Optional) The description of the DocDB subnet group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = null
}
variable "docdb_subnet_group_name" {
  description = "(Optional, Forces new resource) The name of the DocDB subnet group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "docdb_subnet_group_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "docdb_subnet_group_subnet_ids" {
  description = "(Required) A list of VPC subnet IDs"
  type        = list(string)
}
variable "docdb_subnet_group_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
