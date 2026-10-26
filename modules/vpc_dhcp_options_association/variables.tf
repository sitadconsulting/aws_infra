variable "vpc_dhcp_options_association_dhcp_options_id" {
  description = "(Required) ID of the DHCP Options Set to associate to the VPC"
  type        = string
}
variable "vpc_dhcp_options_association_vpc_id" {
  description = "(Required) ID of the VPC to which we would like to associate a DHCP Options Set"
  type        = string
}
