variable "placement_group_name" {
  description = "(Required) Name of the placement group"
  type        = string
}
variable "placement_group_partition_count" {
  description = "(Optional) Number of partitions to create in the placement group. Can only be specified when the strategy is set to partition. Must be at least 1. (default is 2)"
  type        = number
  default     = null
}
variable "placement_group_spread_level" {
  description = "(Optional) How placement groups spread instances. Can only be used when the strategy is set to spread. Can be host or rack. host can only be used for Outpost placement groups. Defaults to rack"
  type        = string
  default     = null
}
variable "placement_group_strategy" {
  description = "(Required) Placement strategy. Can be cluster, partition or spread"
  type        = string
  default     = null
}
variable "placement_group_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
