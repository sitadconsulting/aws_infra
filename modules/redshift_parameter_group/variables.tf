variable "redshift_parameter_group_description" {
  description = "The description of the Redshift parameter group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = ""
}
variable "redshift_parameter_group_family" {
  description = "The family of the Redshift parameter group"
  type        = string
}
variable "redshift_parameter_group_name" {
  description = "The name of the Redshift parameter group"
  type        = string
}
variable "redshift_parameter_group_tag" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "redshift_parameter_group_parameter" {
  description = "A list of Redshift parameters to apply"
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}
