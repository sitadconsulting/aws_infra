variable "vpc_endpoint_subnet_association_subnet_id" {
  description = "The ID of the subnet to be associated with the VPC endpoint"
  type        = string

}
variable "vpc_endpoint_subnet_association_vpc_endpoint_id" {
  description = "The ID of the VPC endpoint with which the subnet will be associated"
  type        = string
}
