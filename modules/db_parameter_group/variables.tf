variable "db_parameter_group_name" {
  description = "The name of the DB parameter group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "db_parameter_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "db_parameter_group_family" {
  description = "The family of the DB parameter group"
  type        = string
}
variable "db_parameter_group_description" {
  description = " The description of the DB parameter group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = ""
}
variable "db_parameter_group_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "db_parameter_group_paramter" {
  description = " A list of DB parameters to apply. Note that parameters may differ from a family to an other. Full list of all parameters can be discovered via aws rds describe-db-parameters after initial creation of the group"
  type        = list(object({
   apply_method = optional(string)
   name         = string
   value        = string
  }))
  default     =  []
}
