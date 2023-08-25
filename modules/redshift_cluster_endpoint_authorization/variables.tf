variable "redshift_endpoint_authorization_account" {
  description = "The Amazon Web Services account ID to grant access to"
  type        = string
}
variable "redshift_endpoint_authorization_cluster_identifier" {
  description = "The cluster identifier of the cluster to grant access to"
  type        = string
}
variable "redshift_endpoint_authorization_force_delete" {
  description = " Indicates whether to force the revoke action. If true, the Redshift-managed VPC endpoints associated with the endpoint authorization are also deleted. Default value is false"
  type        = bool
  default     = false
}
variable "redshift_endpoint_authorization_vpc_ids" {
  description = "The virtual private cloud (VPC) identifiers to grant access to. If none are specified all VPCs in shared account are allowed"
  type        = string
  default     = null
}
