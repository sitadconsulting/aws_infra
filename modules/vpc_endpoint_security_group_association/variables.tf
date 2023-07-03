variable "vpc_endpoint_security_group_association_replace_default_association" {
  description = "Whether this association should replace the association with the VPC's default security group that is created when no security groups are specified during VPC endpoint creation"
  type        = bool
  default     = true
}
variable "vpc_endpoint_security_group_association_security_group_id" {
  description = "The ID of the VPC endpoint with which the security group will be associated"
  type        = string
}
variable "vpc_endpoint_security_group_association_vpc_endpoint_id" {
  description = "The ID of the security group to be associated with the VPC endpoint"
  type        = string
}
