variable "redshift_endpoint_access_cluster_identifier" {
  description = "The cluster identifier of the cluster to access"
  type        = string
}
variable "redshift_endpoint_access_endpoint_name" {
  description = "The Redshift-managed VPC endpoint name"
  type        = string
}
variable "redshift_endpoint_access_resource_owner" {
  description = "The Amazon Web Services account ID of the owner of the cluster. This is only required if the cluster is in another Amazon Web Services account"
  type        = string
  default     = ""
}
variable "redshift_endpoint_access_subnet_group_name" {
  description = "The subnet group from which Amazon Redshift chooses the subnet to deploy the endpoint"
  type        = string
}
variable "redshift_endpoint_access_vpc_security_group_ids" {
  description = "The security group that defines the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint"
  type        = string
  default     = ""
}
