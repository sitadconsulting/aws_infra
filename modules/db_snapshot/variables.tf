variable "db_snapshot_db_instance_identifier" {
  description = "The DB Instance Identifier from which to take the snapshot"
  type        = string
}
variable "db_snapshot_db_snapshot_identifier" {
  description = "The Identifier for the snapsho"
  type        = string
}
variable "db_snapshot_shared_accounts" {
  description = "List of AWS Account ids to share snapshot with, use all to make snaphot public"
  type        = list(string)
  default     = []
}
variable "db_snapshot_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
