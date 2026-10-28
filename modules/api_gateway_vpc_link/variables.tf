variable "api_gateway_vpc_link_description" {
  description = "(Optional) Description of the VPC link"
  type        = string
  default     = null
}
variable "api_gateway_vpc_link_name" {
  description = " (Required) Name used to label and identify the VPC link"
  type        = string
}
variable "api_gateway_vpc_link_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "api_gateway_vpc_link_target_arns" {
  description = "(Required, ForceNew) List of network load balancer arns in the VPC targeted by the VPC link. Currently AWS only supports 1 target"
  type        = list(string)
  default     = null
}
