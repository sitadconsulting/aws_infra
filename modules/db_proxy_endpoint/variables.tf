variable "db_proxy_endpoint_db_proxy_endpoint_name" {
  description = "The identifier for the proxy endpoint"
  type        = string
}
variable "db_proxy_endpoint_db_proxy_name" {
  description = "The name of the DB proxy associated with the DB proxy endpoint that you create"
  type        = string
}
variable "db_proxy_endpoint_vpc_subnet_ids" {
  description = "One or more VPC subnet IDs to associate with the new proxy"
  type        = list(string)
}
variable "db_proxy_endpoint_vpc_security_group_ids" {
  description = "One or more VPC security group IDs to associate with the new proxy"
  type        = list(string)
  default     = []
}
variable "db_proxy_endpoint_target_role" {
  description = "Indicates whether the DB proxy endpoint can be used for read/write or read-only operations. The default is READ_WRITE. Valid values are READ_WRITE and READ_ONLY"
  type        = string
  default     = "READ_WRITE"
}
variable "db_proxy_endpoint_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
