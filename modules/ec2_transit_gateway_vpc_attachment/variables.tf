variable "ec2_transit_gateway_vpc_attachment_appliance_mode_support" {
  description = " "
  type        =
  default     =
}
variable "ec2_transit_gateway_vpc_attachment_dns_support" {
  description = " "
  type        =
  default     =


}
variable "ec2_transit_gateway_vpc_attachment_ipv6_support" {
  description = "Whether IPv6 support is enabled. Valid values: disable, enable. Default value: disable"
  type        = string
  default     = "disable"
}
variable "ec2_transit_gateway_vpc_attachment_subnet_ids" {
  description = "Identifiers of EC2 Subnets"
  type        = string
}
variable "ec2_transit_gateway_vpc_attachment_tags" {
  description = "Key-value tags for the EC2 Transit Gateway VPC Attachment. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ec2_transit_gateway_vpc_attachment_transit_gateway_default_route_table_association" {
  description = "Boolean whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: true"
  type        = bool
  default     = false
}
variable "ec2_transit_gateway_vpc_attachment_transit_gateway_default_route_table_propagation" {
  description = "Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: true"
  type        = bool
  default     = false
}
variable "ec2_transit_gateway_vpc_attachment_transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  type        = string
}
variable "ec2_transit_gateway_vpc_attachment_vpc_id" {
  description = "Identifier of EC2 VPC"
  type        = string
}
