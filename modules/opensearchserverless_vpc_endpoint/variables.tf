variable "opensearchserverless_vpc_endpoint_name" {
  description = "Name of the interface endpoint"
  type        = string
}
variable "opensearchserverless_vpc_endpoint_security_group_id" {
  description = "One or more security groups that define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint. Up to 5 security groups can be provided"
  type        = list(string)
  default     = []
}
variable "opensearchserverless_vpc_endpoint_subnet_ids" {
  description = "One or more subnet IDs from which you'll access OpenSearch Serverless. Up to 6 subnets can be provided"
  type        = list(string)
}
variable "opensearchserverless_vpc_endpoint_vpc_id" {
  description = "ID of the VPC from which you'll access OpenSearch Serverless"
  type        = string
}
