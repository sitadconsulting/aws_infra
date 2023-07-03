variable "vpc_endpoint_service_acceptance_required" {
  description = "Whether or not VPC endpoint connection requests to the service must be accepted by the service owner - true or false"
  type        = bool
  default     = false
}
variable "vpc_endpoint_service_allowed_principals" {
  description = "The ARNs of one or more principals allowed to discover the endpoint service"
  type        = list(string)
  default     = []
}
variable "vpc_endpoint_service_gateway_load_balancer_arns" {
  description = "Amazon Resource Names (ARNs) of one or more Gateway Load Balancers for the endpoint service"
  type        = list(string)
  default     = []
}
variable "vpc_endpoint_service_network_load_balancer_arns" {
  description = "Amazon Resource Names (ARNs) of one or more Network Load Balancers for the endpoint service"
  type        = list(string)
  default     = []
}
variable "vpc_endpoint_service_private_dns_name" {
  description = "The private DNS name for the service"
  type        = string
  default     = ""
}
variable "vpc_endpoint_service_supported_ip_address_types" {
  description = "The supported IP address types. The possible values are ipv4 and ipv6"
  type        = string
  default     = "ipv4"
}
variable "vpc_endpoint_service_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
