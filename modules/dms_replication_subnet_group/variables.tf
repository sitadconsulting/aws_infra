variable "dms_replication_subnet_group_replication_subnet_group_description" {
  description = "(Required) Description for the subnet group"
  type        = string
}
variable "dms_replication_subnet_group_replication_subnet_group_id" {
  description = "(Required) Name for the replication subnet group. This value is stored as a lowercase string. It must contain no more than 255 alphanumeric characters, periods, spaces, underscores, or hyphens and cannot be default "
  type        = string
}
variable "dms_replication_subnet_group_subnet_ids" {
  description = "(Required) List of at least 2 EC2 subnet IDs for the subnet group. The subnets must cover at least 2 availability zones"
  type        = list(string)
}
variable "dms_replication_subnet_group_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
