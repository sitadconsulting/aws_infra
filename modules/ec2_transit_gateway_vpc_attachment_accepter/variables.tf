variable "ec2_transit_gateway_vpc_attachment_accepter_transit_gateway_attachment_id" {
  description = "The ID of the EC2 Transit Gateway Attachment to manage"
  type        = string
}
variable "ec2_transit_gateway_vpc_attachment_accepter_tags" {
  description = "Key-value tags for the EC2 Transit Gateway VPC Attachment. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ec2_transit_gateway_vpc_attachment_accepter_transit_gateway_default_route_table_association" {
  description = "Boolean whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. Default value: true"
  type        = bool
  default     = false
}
variable "ec2_transit_gateway_vpc_attachment_accepter_transit_gateway_default_route_table_propagation" {
  description = "Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. Default value: true"
  type        = bool
  default     = false
}
