variable "vpc_peering_connection_accepter_auto_accept" {
  description = "(Optional) Whether or not to accept the peering request. Defaults to false"
  type        = bool
  default     = null
}
variable "vpc_peering_connection_accepter_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "vpc_peering_connection_accepter_vpc_peering_connection_id" {
  description = "(Required) VPC Peering Connection ID to manage"
  type        = string
}
variable "vpc_peering_connection_accepter_accepter" {
  description = "(Optional) Configuration block for VPC Peering Connection options to set for the VPC that accepts the peering connection (a maximum of one)"
  type        = list(object({
    allow_remote_vpc_dns_resolution = optional(bool)
  }))
  default     = []
}
variable "vpc_peering_connection_accepter_requester" {
  description = "(Optional) Configuration block for VPC Peering Connection options to set for the VPC that requests the peering connection (a maximum of one)"
  type        = list(object({
    allow_remote_vpc_dns_resolution = optional(bool)
  }))
  default     = []
}
