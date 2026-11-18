variable "dax_parameter_group_description" {
  description = "(Optional, ForceNew) A description of the parameter group"
  type        = string
  default     = null
}
variable "dax_parameter_group_name" {
  description = "(Required) The name of the parameter group"
  type        = string
}
variable "dax_parameter_group_parameters" {
  description = "(Optional) The parameters of the parameter group"
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}
