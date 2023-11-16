variable "ec2_transit_gateway_route_table_association_replace_existing_association" {
  description = "Boolean whether the Gateway Attachment should remove any current Route Table association before associating with the specified Route Table. Default value: false. This argument is intended for use with EC2 Transit Gateways shared into the current account, otherwise the transit_gateway_default_route_table_association argument of the aws_ec2_transit_gateway_vpc_attachment resource should be used"
  type        = bool
  default     = false
}
variable "ec2_transit_gateway_route_table_association_transit_gateway_attachment_id" {
  description = "Identifier of EC2 Transit Gateway Attachment"
  type        = string
}
variable "ec2_transit_gateway_route_table_association_transit_gateway_route_table_id" {
  description = "Identifier of EC2 Transit Gateway Route Table"
  type        = string
}
