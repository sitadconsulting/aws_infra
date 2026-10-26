variable "vpc_endpoint_private_dns_private_dns_enabled" {
  description = "(Required) Whether to associate a private hosted zone with the VPC. Only applicable for Interface endpoints"
  type        = bool
  default     = null
}
variable "vpc_endpoint_private_dns_vpc_endpoint_id" {
  description = "(Required) VPC endpoint identifier"
  type        = string
}
