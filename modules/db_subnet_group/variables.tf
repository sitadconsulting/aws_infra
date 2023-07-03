variable "db_subnet_group_name" {
  description = "The name of the DB subnet group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}
variable "db_subnet_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = ""
}
variable "db_subnet_group_description" {
  description = "The description of the DB subnet group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = ""
}
variable "db_subnet_group_subnet_ids" {
  description = "A list of VPC subnet ID"
  type        = list(string)
}
variable "db_subnet_group_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
