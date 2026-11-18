variable "emr_block_public_access_configuration_block_public_security_group_rules" {
  description = "(Required) Enable or disable EMR Block Public Access"
  type        = bool
  default     = null
}
variable "emr_block_public_access_configuration_permitted_public_security_group_rule_range" {
  description = "(Optional) Configuration block for defining permitted public security group rule port ranges. Can be defined multiple times per resource. Only valid if block_public_security_group_rules is set to true"
  type        = list(object({
    min_range = number
    max_range = number
  }))
  default     = []
}
