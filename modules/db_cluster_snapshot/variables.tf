variable "db_cluster_snapshot_db_cluster_identifier" {
  description = "The DB Cluster Identifier from which to take the snapshot"
  type        = string
}
variable "db_cluster_snapshot_db_cluster_snapshot_identifier" {
  description = "The Identifier for the snapshot"
  type        = string
}
variable "db_cluster_snapshot_tags" {
  description = "A map of tags to assign to the DB cluster"
  type        = map(string)
  default     = {}
}
