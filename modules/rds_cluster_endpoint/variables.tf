variable "rds_cluster_endpoint_cluster_identifier" {
  description = "The cluster identifier"
  type        = string
}
variable "rds_cluster_endpoint_cluster_endpoint_identifier" {
  description = "The identifier to use for the new endpoint. This parameter is stored as a lowercase string"
  type        = string
}
variable "rds_cluster_endpoint_custom_endpoint_type" {
  description = "The type of the endpoint. One of: READER , ANY"
  type        = string
}
variable "rds_cluster_endpoint_static_members" {
  description = "List of DB instance identifiers that are part of the custom endpoint group. Conflicts with excluded_members"
  type        = list(string)
  default     = []
}
variable "rds_cluster_endpoint_excluded_members" {
  description = "List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible instances are reachable through the custom endpoint. Only relevant if the list of static members is empty"
  type        = list(string)
  default     = []
}
variable "rds_cluster_endpoint_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
