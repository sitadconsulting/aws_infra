variable "apigatewayv2_vpc_link_name" {
  description = "(Required) Name of the VPC Link. Must be between 1 and 128 characters in length"
  type        = string
}
variable "apigatewayv2_vpc_link_security_group_ids" {
  description = "(Required) Security group IDs for the VPC Link"
  type        = string
}
variable "apigatewayv2_vpc_link_subnet_ids" {
  description = "(Required) Subnet IDs for the VPC Link"
  type        = string
}
variable "apigatewayv2_vpc_link_tags" {
  description = "(Optional) Map of tags to assign to the VPC Link"
  type        = map(string)
  default     = {}
}
