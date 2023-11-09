variable "apigatewayv2_vpc_link_name" {
  description = "Name of the VPC Link. Must be between 1 and 128 characters in length"
  type        = string
}
variable "apigatewayv2_vpc_link_security_group_ids" {
  description = "Security group IDs for the VPC Link"
  type        = string
}
variable "apigatewayv2_vpc_link_subnet_ids" {
  description = "Subnet IDs for the VPC Link"
  type        = string
}
variable "apigatewayv2_vpc_link_tags" {
  description = "Map of tags to assign to the VPC Link. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
