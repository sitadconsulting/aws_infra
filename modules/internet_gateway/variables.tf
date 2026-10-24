variable "internet_gateway_vpc_id" {
  description = "(Optional) The VPC ID to create in"
  type        = string
  default     = null
}
variable "internet_gateway_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
