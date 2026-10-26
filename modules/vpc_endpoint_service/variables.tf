variable "vpc_endpoint_service_acceptance_required" {
  description = "(Required) Whether or not VPC endpoint connection requests to the service must be accepted by the service owner - true or false"
  type        = bool
  default     = false
}
variable "vpc_endpoint_service_allowed_principals" {
  description = "(Optional) ARNs of one or more principals allowed to discover the endpoint service"
  type        = list(string)
  default     = null
}
variable "vpc_endpoint_service_gateway_load_balancer_arns" {
  description = "(Optional) ARNs of one or more Gateway Load Balancers for the endpoint service"
  type        = list(string)
  default     = null
}
variable "vpc_endpoint_service_network_load_balancer_arns" {
  description = "(Optional) ARNs of one or more Network Load Balancers for the endpoint service"
  type        = list(string)
  default     = null
}
variable "vpc_endpoint_service_private_dns_name" {
  description = "(Optional) Private DNS name for the service"
  type        = string
  default     = null
}
variable "vpc_endpoint_service_supported_ip_address_types" {
  description = " (Optional) Supported IP address types. The possible values are ipv4 and ipv6"
  type        = string
  default     = "ipv4"
}
variable "vpc_endpoint_service_supported_regions" {
  description = "(Optional) Set of regions from which service consumers can access the service"
  type        = list(string)
  default     = null
}
variable "vpc_endpoint_service_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
