variable "ec2_transit_gateway_prefix_list_reference_blackhole" {
  description = "Indicates whether to drop traffic that matches the Prefix List. Defaults to false"
  type        = bool
  default     = false
}
variable "ec2_transit_gateway_prefix_list_reference_prefix_list_id" {
  description = "Identifier of EC2 Prefix List"
  type        = string
}
variable "ec2_transit_gateway_prefix_list_reference_transit_gateway_attachment_id" {
  description = "Identifier of EC2 Transit Gateway Attachment"
  type        = string
  default     = null
}
variable "ec2_transit_gateway_prefix_list_reference_transit_gateway_route_table_id" {
  description = "Identifier of EC2 Transit Gateway Route Table"
  type        = string
}
