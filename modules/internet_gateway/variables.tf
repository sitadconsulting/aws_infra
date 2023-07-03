variable "internet_gateway_vpc_id" {
  description = "The VPC ID to create in"
  type        = string
  default     = ""
}
variable "internet_gateway_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
