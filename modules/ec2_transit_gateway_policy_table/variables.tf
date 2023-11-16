variable "ec2_transit_gateway_policy_table_transit_gateway_id" {
  description = "EC2 Transit Gateway identifier"
  type        = string
}
variable "ec2_transit_gateway_policy_table_tags" {
  description = "Key-value tags for the EC2 Transit Gateway Policy Table. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
