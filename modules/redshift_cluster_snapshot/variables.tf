variable "redshift_cluster_snapshot_cluster_identifier" {
  description = "The cluster identifier for which you want a snapshot"
  type        = string
}
variable "redshift_cluster_snapshot_manual_snapshot_retention_period" {
  description = "A unique identifier for the snapshot that you are requesting. This identifier must be unique for all snapshots within the Amazon Web Services account"
  type        = string
}
variable "redshift_cluster_snapshot_snapshot_identifier" {
  description = "The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is retained indefinitely. Valid values are -1 and between 1 and 3653"
  type        = number
  default     = null
}
variable "redshift_cluster_snapshot_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
