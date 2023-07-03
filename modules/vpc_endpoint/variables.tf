variable "vpc_endpoint_auto_accept" {
  description = "Accept the VPC endpoint (the VPC endpoint and service need to be in the same AWS account)"
  type        = bool
  default     = null
}
variable "vpc_endpoint_ip_address_type" {
  description = "The IP address type for the endpoint. Valid values are ipv4, dualstack, and ipv6"
  type        = string
  default     = "ipv4"
}
variable "vpc_endpoint_policy" {
  description = "A policy to attach to the endpoint that controls access to the service. This is a JSON formatted string. Defaults to full access"
  type        = string
  default     = ""
}
variable "vpc_endpoint_private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface. Defaults to false"
  type        = bool
  default     = false
}
variable "vpc_endpoint_route_table_ids" {
  description = "One or more route table IDs. Applicable for endpoints of type Gateway"
  type        = list(string)
  default     = []
}
variable "vpc_endpoint_security_group_id" {
  description = "The ID of one or more security groups to associate with the network interface. Applicable for endpoints of type Interface. If no security groups are specified, the VPC's default security group is associated with the endpoint"
  type        = list(string)
  default     = []
}
variable "vpc_endpoint_service_name" {
  description = "The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service>"
  type        = string
  default     = ""
}
variable "vpc_endpoint_subnet_ids" {
  description = "The ID of one or more subnets in which to create a network interface for the endpoint. Applicable for endpoints of type GatewayLoadBalancer and Interface"
  type        = list(string)
  default     = []
}
variable "vpc_endpoint_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "vpc_endpoint_vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = string

}
variable "vpc_endpoint_vpc_endpoint_type" {
  description = "The VPC endpoint type, Gateway, GatewayLoadBalancer, or Interface. Defaults to Gateway"
  type        = string
  default     = "Gateway"
}
variable "vpc_endpoint_dns_options" {
  description = "The DNS options for the endpoint"
  type        = list(object({
    dns_record_ip_type = optional(string)
  }))
  default     = []
}
