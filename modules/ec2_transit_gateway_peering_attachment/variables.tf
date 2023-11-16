variable "ec2_transit_gateway_peering_attachment_peer_account_id" {
  description = "Account ID of EC2 Transit Gateway to peer with. Defaults to the account ID the AWS provider is currently connected to"
  type        = string
  default     = null
}
variable "ec2_transit_gateway_peering_attachment_peer_region" {
  description = "Region of EC2 Transit Gateway to peer with"
  type        = string
}
variable "ec2_transit_gateway_peering_attachment_peer_transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway to peer with"
  type        = string
}
variable "ec2_transit_gateway_peering_attachment_tags" {
  description = "Key-value tags for the EC2 Transit Gateway Peering Attachment. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ec2_transit_gateway_peering_attachment_transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  type        = string
}
