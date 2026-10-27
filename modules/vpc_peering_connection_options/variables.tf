variable "vpc_peering_connection_options_vpc_peering_connection_id" {
  description = "(Required) ID of the requester VPC peering connection"
  type        = string
}
variable "vpc_peering_connection_options_accepter" {
  description = "(Optional) Configuration block for VPC Peering Connection options to set for the VPC that accepts the peering connection (a maximum of one)"
  type        = list(object({
    allow_remote_vpc_dns_resolution = optional(bool)
  }))
  default     = []
}
variable "vpc_peering_connection_options_requester" {
  description = "(Optional) Configuration block for VPC Peering Connection options to set for the VPC that requests the peering connection (a maximum of one)"
  type        = list(object({
    allow_remote_vpc_dns_resolution = optional(bool)
  }))
  default     = []
}
