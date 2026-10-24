variable "security_group_description" {
  description = "(Optional, Forces new resource) Security group description. Defaults to Managed by Terraform. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags"
  type        = string
  default     = "Managed by Terraform"
}
variable "security_group_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "security_group_name" {
  description = "(Optional, Forces new resource) Name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "security_group_revoke_rules_on_delete" {
  description = "(Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false"
  type        = bool
  default     = false
}
variable "security_group_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "security_group_vpc_id" {
  description = "(Optional, Forces new resource) VPC ID. Defaults to the region's default VPC"
  type        = string
  default     = null
}
variable "security_group_egress" {
  description = "(Optional, VPC only) Configuration block for egress rules. Can be specified multiple times for each egress rule. Each egress block supports fields documented below. This argument is processed in attribute-as-blocks mode"
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
  description = "(Optional) Configuration block for ingress rules. Can be specified multiple times for each ingress rule. Each ingress block supports fields documented below. This argument is processed in attribute-as-blocks mode"
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
