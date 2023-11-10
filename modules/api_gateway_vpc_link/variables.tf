variable "api_gateway_vpc_link_name" {
  description = "Name used to label and identify the VPC link"
  type        = string
}
variable "api_gateway_vpc_link_description" {
  description = "Description of the VPC link"
  type        = string
  default     = ""
}
variable "api_gateway_vpc_link_target_arns" {
  description = "List of network load balancer arns in the VPC targeted by the VPC link. Currently AWS only supports 1 target"
  type        = list(string)
  default     = []
}
variable "api_gateway_vpc_link_tags" {
  description = " Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
