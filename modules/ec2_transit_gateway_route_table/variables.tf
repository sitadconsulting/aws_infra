variable "ec2_transit_gateway_route_table_transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  type        = string
}
variable "ec2_transit_gateway_route_table_tags" {
  description = "Key-value tags for the EC2 Transit Gateway Route Table. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
