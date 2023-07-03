variable "vpclattice_service_network_vpc_association_vpc_identifier" {
  description = "The ID of the VPC"
  type        = string
}
variable "vpclattice_service_network_vpc_association_service_network_identifier" {
  description = "The ID or Amazon Resource Identifier (ARN) of the service network"
  type        = string
}
variable  "vpclattice_service_network_vpc_association_security_group_ids" {
  description = "The IDs of the security groups"
  type        = list(string)
  default     = []
}
variable "vpclattice_service_network_vpc_association_tags" {
  description = "Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
