variable "ec2_transit_gateway_route_blackhole" {
  description = "Indicates whether to drop traffic that matches this route (default to false)"
  type        = bool
  default     = false
}
variable "ec2_transit_gateway_route_destination_cidr_block" {
  description = "IPv4 or IPv6 RFC1924 CIDR used for destination matches. Routing decisions are based on the most specific match"
  type        = string
}
variable "ec2_transit_gateway_route_transit_gateway_attachment_id" {
  description = "Identifier of EC2 Transit Gateway Attachment (required if blackhole is set to false)"
  type        = string
  default     = null
}
variable "ec2_transit_gateway_route_transit_gateway_route_table_id" {
  description = "Identifier of EC2 Transit Gateway Route Table"
  type        = string
}
