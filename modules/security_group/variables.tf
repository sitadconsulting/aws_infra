variable "security_group_description" {
  description = "Security group description. Defaults to Managed by Terraform. Cannot be"
  type        = string
  default     = "Managed by Terraform"
}
variable "security_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "security_group_name" {
  description = "Name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}
variable "security_group_revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false"
  type        = bool
  default     = false
}
variable "security_group_tags" {
  description = "Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "security_group_vpc_id" {
  description = "VPC ID. Defaults to the region's default VPC"
  type        = string
  default     = ""
}
variable "security_group_egress" {
  description = "Configuration block for egress rules. Can be specified multiple times for each egress rule"
  type        = list(object({
    cidr_blocks      = optional(list(string))
    description      = optional(string)
    from_port        = number
    ipv6_cidr_blocks = optional(list(string))
    prefix_list_ids  = optional(list(string))
    protocol         = string
    security_groups  = optional(list(string))
    self             = optional(bool)
    to_port          = number
  }))
  default     = []
}
variable "security_group_ingress" {
  description = "Configuration block for ingress rules. Can be specified multiple times for each ingress rule"
  type        = list(object({
    cidr_blocks      = optional(list(string))
    description      = optional(string)
    from_port        = number
    ipv6_cidr_blocks = optional(list(string))
    prefix_list_ids  = optional(list(string))
    protocol         = string
    security_groups  = optional(list(string))
    self             = optional(bool)
    to_port          = number
  }))
  default     = []
}
