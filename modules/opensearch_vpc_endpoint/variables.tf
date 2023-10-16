variable "opensearch_vpc_endpoint_domain_arn" {
  description = "Specifies the Amazon Resource Name (ARN) of the domain to create the endpoint for"
  type        = string
}
variable "opensearch_vpc_endpoint_vpc_options" {
  description = "Configuration Options to specify the subnets and security groups for the endpoint"
  type        = list(object({
    security_group_ids = optional(list(string))
    subnet_ids         = list(string)
  }))
  default     = []
}
