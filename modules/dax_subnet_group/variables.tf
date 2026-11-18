variable "dax_subnet_group_description" {
  description = "(Optional) A description of the subnet group"
  type        = string
  default     = null
}
variable "dax_subnet_group_name" {
  description = "(Required) The name of the subnet group"
  type        = string
}
variable "dax_subnet_group_subnet_ids" {
  description = "(Required) A list of VPC subnet IDs for the subnet group"
  type        = list(string)
}
