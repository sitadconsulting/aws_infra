variable "ec2_transit_gateway_multicast_group_source_group_ip_address" {
  description = "The IP address assigned to the transit gateway multicast group"
  type        = string
}
variable "ec2_transit_gateway_multicast_group_source_network_interface_id" {
  description = "The group members' network interface ID to register with the transit gateway multicast group"
  type        = string
}
variable "ec2_transit_gateway_multicast_group_source_transit_gateway_multicast_domain_id" {
  description = "The ID of the transit gateway multicast domain"
  type        = string
}
