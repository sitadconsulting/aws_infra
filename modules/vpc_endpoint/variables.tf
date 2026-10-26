variable "vpc_endpoint_auto_accept" {
  description = "(Optional) Whether to accept the VPC endpoint (the VPC endpoint and service need to be in the same AWS account)"
  type        = bool
  default     = null
}
variable "vpc_endpoint_ip_address_type" {
  description = "(Optional) IP address type for the endpoint. Valid values are ipv4, dualstack, and ipv6"
  type        = string
  default     = null
}
variable "vpc_endpoint_policy" {
  description = "(Optional) Policy to attach to the endpoint that controls access to the service. This is a JSON formatted string. Defaults to full access. All Gateway and some Interface endpoints support policies - see the relevant AWS documentation for more details"
  type        = string
  default     = null
}
variable "vpc_endpoint_private_dns_enabled" {
  description = "(Optional) Whether to associate a private hosted zone with the specified VPC. Available for AWS services and AWS Marketplace partner services only. Applicable for endpoints of type Interface. Most users will want this enabled to allow services within the VPC to automatically use the endpoint. Defaults to false. If vpc_endpoint_type is anything other than Interface, changing this value forces a new resource to be created"
  type        = bool
  default     = false
}
variable "vpc_endpoint_resource_configuration_arn" {
  description = " (Optional) ARN of a Resource Configuration to connect this VPC Endpoint to. Exactly one of resource_configuration_arn, service_name or service_network_arn is required"
  type        = string
  default     = null
}
variable "vpc_endpoint_route_table_ids" {
  description = "(Optional) One or more route table IDs. Applicable for endpoints of type Gateway"
  type        = list(string)
  default     = null
}
variable "vpc_endpoint_security_group_id" {
  description = "(Optional) ID of one or more security groups to associate with the network interface. Applicable for endpoints of type Interface. If no security groups are specified, the VPC's default security group is associated with the endpoint"
  type        = list(string)
  default     = null
}
variable "vpc_endpoint_service_name" {
  description = "(Optional) Service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service> (the SageMaker AI Notebook service is an exception to this rule, the service name is in the form aws.sagemaker.<region>.notebook). Exactly one of resource_configuration_arn, service_name or service_network_arn is required"
  type        = string
  default     = null
}
variable "vpc_endpoint_service_network_arn" {
  description = "(Optional) ARN of a Service Network to connect this VPC Endpoint to. Exactly one of resource_configuration_arn, service_name or service_network_arn is required"
  type        = string
  default     = null
}
variable "vpc_endpoint_service_region" {
  description = "(Optional) AWS region of the VPC Endpoint Service. If specified, the VPC endpoint will connect to the service in the provided region. Applicable for endpoints of type Interface"
  type        = string
  default     = null
}
variable "vpc_endpoint_subnet_ids" {
  description = "(Optional) ID of one or more subnets in which to create a network interface for the endpoint. Applicable for endpoints of type GatewayLoadBalancer and Interface. Interface type endpoints cannot function without being assigned to a subnet"
  type        = list(string)
  default     = null
}
variable "vpc_endpoint_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "vpc_endpoint_vpc_endpoint_type" {
  description = "(Optional) VPC endpoint type, Gateway, GatewayLoadBalancer,Interface, Resource or ServiceNetwork. Defaults to Gateway"
  type        = string
  default     = null
}
variable "vpc_endpoint_vpc_id" {
  description = "(Required) ID of the VPC in which the endpoint will be used"
  type        = string
}
variable "vpc_endpoint_dns_options" {
  description = "(Optional) DNS options for the endpoint"
  type        = list(object({
    dns_record_ip_type                             = optional(string)
    private_dns_only_for_inbound_resolver_endpoint = optional(bool)
    private_dns_preference                         = optional(string)
    private_dns_specified_domains                  = optional(list(string))
  }))
  default     = []
}
variable "vpc_endpoint_subnet_configuration" {
  description = "(Optional) Subnet configuration for the endpoint, used to select specific IPv4 and/or IPv6 addresses to the endpoint"
  type        = list(object({
    ipv4      = optional(string)
    ipv6      = optional(string)
    subnet_id = optional(string)
  }))
  default     = []
}
