variable "vpc_security_group_vpc_association_security_group_id" {
  description = "(Required) ID of the security group"
  type        = string
}
variable "vpc_security_group_vpc_association_vpc_id" {
  description = "(Required) ID of the VPC to make the association with"
  type        = string
}
