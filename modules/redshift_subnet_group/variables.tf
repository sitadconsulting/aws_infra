variable "redshift_subnet_group_description" {
  description = "The description of the Redshift Subnet group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = ""
}
variable "redshift_subnet_group_name" {
  description = "The name of the Redshift Subnet group"
  type        = string
}
variable "redshift_subnet_group_subnet_ids" {
  description = "An array of VPC subnet IDs"
  type        = list(string)
  default     = []
}
variable "redshift_subnet_group_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
