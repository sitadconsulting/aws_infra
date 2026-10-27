variable "vpc_peering_connection_auto_accept" {
  description = "(Optional) Whether to accept the peering (both VPCs need to be in the same AWS account and region)"
  type        = bool
  default     = null
}
variable "vpc_peering_connection_peer_owner_id" {
  description = "(Optional) AWS account ID of the target peer VPC. Defaults to the account ID the AWS provider is currently connected to, so must be managed if connecting cross-account"
  type        = string
  default     = null
}
variable "vpc_peering_connection_peer_region" {
  description = "(Optional) Region of the accepter VPC of the VPC Peering Connection. auto_accept must be false, and use the aws_vpc_peering_connection_accepter to manage the accepter side"
  type        = string
  default     = null
}
variable "vpc_peering_connection_peer_vpc_id" {
  description = "(Required) ID of the target VPC with which you are creating the VPC Peering Connection"
  type        = string
}
variable "vpc_peering_connection_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "vpc_peering_connection_vpc_id" {
  description = "(Required) ID of the requester VPC"
  type        = string
}
variable "vpc_peering_connection_accepter" {
  description = "(Optional) Configuration block for VPC Peering Connection options to set for the VPC that accepts the peering connection (a maximum of one)"
  type        = list(object({
    allow_remote_vpc_dns_resolution = optional(bool)
  }))
  default     = []
}
variable "vpc_peering_connection_requester" {
  description = "(Optional) Configuration block for VPC Peering Connection options to set for the VPC that requests the peering connection (a maximum of one)"
  type        = list(object({
    allow_remote_vpc_dns_resolution = optional(bool)
  }))
  default     = []
}
