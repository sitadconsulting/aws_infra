variable "ec2_transit_gateway_multicast_domain_auto_accept_shared_associations" {
  description = "Whether to automatically accept cross-account subnet associations that are associated with the EC2 Transit Gateway Multicast Domain. Valid values: disable, enable. Default value: disable"
  type        = string
  default     = "disable"
}
variable "ec2_transit_gateway_multicast_domain_igmpv2_support" {
  description = "Whether to enable Internet Group Management Protocol (IGMP) version 2 for the EC2 Transit Gateway Multicast Domain. Valid values: disable, enable. Default value: disable"
  type        = string
  default     = "disable"
}
variable "ec2_transit_gateway_multicast_domain_static_sources_support" {
  description = "Whether to enable support for statically configuring multicast group sources for the EC2 Transit Gateway Multicast Domain. Valid values: disable, enable. Default value: disable"
  type        = string
  default     = "disable"
}
variable "ec2_transit_gateway_multicast_domain_tags" {
  description = "Key-value tags for the EC2 Transit Gateway Multicast Domain. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ec2_transit_gateway_multicast_domain_transit_gateway_id" {
  description = "EC2 Transit Gateway identifier. The EC2 Transit Gateway must have multicast_support enabled"
  type        = string
}
