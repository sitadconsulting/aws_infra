variable "ec2_transit_gateway_connect_protocol" {
  description = "The tunnel protocol. Valid values: gre. Default is gre"
  type        = string
  default     = "gre"
}
variable "ec2_transit_gateway_connect_tags" {
  description = " Key-value tags for the EC2 Transit Gateway Connect. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ec2_transit_gateway_connect_transit_gateway_default_route_table_association" {
  description = "Boolean whether the Connect should be associated with the EC2 Transit Gateway association default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: true"
  type        = bool
  default     = false
}
variable "ec2_transit_gateway_connect_transit_gateway_default_route_table_propagation" {
  description = " Boolean whether the Connect should propagate routes with the EC2 Transit Gateway propagation default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: true"
  type        = bool
  default     = false
}
variable "ec2_transit_gateway_connect_transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  type        = string
}
variable "ec2_transit_gateway_connect_transport_attachment_id" {
  description = "The underlaying VPC attachment"
  type        = string
}
