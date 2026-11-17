variable "docdb_cluster_snapshot_db_cluster_identifier" {
  description = "(Required) The DocumentDB Cluster Identifier from which to take the snapshot"
  type        = string
}
variable "docdb_cluster_snapshot_db_cluster_snapshot_identifier" {
  description = "(Required) The Identifier for the snapshot"
  type        = string
}
