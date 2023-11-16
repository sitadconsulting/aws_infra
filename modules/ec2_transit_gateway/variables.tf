variable "ec2_transit_gateway_amazon_side_asn" {
  description = "Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. Default value: 64512"
  type        = number
  default     = 64512
}
variable "ec2_transit_gateway_auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted. Valid values: disable, enable. Default value: disable"
  type        = string
  default     = "disable"
}
variable "ec2_transit_gateway_default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table. Valid values: disable, enable. Default value: enable"
  type        = string
  default     = "disable"
}
variable "ec2_transit_gateway_default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: disable, enable. Default value: enable"
  type        = string
  default     = "disable"
}
variable "ec2_transit_gateway_description" {
  description = "Description of the EC2 Transit Gateway"
  type        = string
  default     = ""
}
variable "ec2_transit_gateway_dns_support" {
  description = "Whether DNS support is enabled. Valid values: disable, enable. Default value: enable"
  type        = string
  default     = "enable"
}
variable "ec2_transit_gateway_multicast_support" {
  description = "Whether Multicast support is enabled. Required to use ec2_transit_gateway_multicast_domain. Valid values: disable, enable. Default value: disable"
  type        = string
  default     = "disable"
}
variable "ec2_transit_gateway_tags" {
  description = "Key-value tags for the EC2 Transit Gateway. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ec2_transit_gateway_transit_gateway_cidr_blocks" {
  description = "One or more IPv4 or IPv6 CIDR blocks for the transit gateway. Must be a size /24 CIDR block or larger for IPv4, or a size /64 CIDR block or larger for IPv6"
  type        = list(string)
  default     = []
}
variable "ec2_transit_gateway_vpn_ecmp_support" {
  description = "Whether VPN Equal Cost Multipath Protocol support is enabled. Valid values: disable, enable. Default value: enable"
  type        = string
  default     = "enable"
}
