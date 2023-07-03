variable "rds_cluster_parameter_group_description" {
  description = "The description of the DB cluster parameter group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = ""
}
variable "rds_cluster_parameter_group_family" {
  description = "The family of the DB cluster parameter group"
  type        = string
}
variable "rds_cluster_parameter_group_name" {
  description = "The name of the DB cluster parameter group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}
variable "rds_cluster_parameter_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = ""
}
variable "rds_cluster_parameter_group_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
