variable "ec2_secondary_network_ipv4_cidr_block" {
  description = "(Required) IPv4 CIDR block for the secondary network. The CIDR block size must be between /12 and /28"
  type        = string
}
variable "ec2_secondary_network_network_type" {
  description = "(Required) Type of secondary network. Currently only rdma is supported"
  type        = string
}
variable "ec2_secondary_network_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
