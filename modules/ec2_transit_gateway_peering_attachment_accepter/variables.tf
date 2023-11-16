variable "ec2_transit_gateway_peering_attachment_accepter_transit_gateway_attachment_id" {
  description = "The ID of the EC2 Transit Gateway Peering Attachment to manage"
  type        = string
}
variable "ec2_transit_gateway_peering_attachment_accepter_tags" {
  description = "Key-value tags for the EC2 Transit Gateway Peering Attachment. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
