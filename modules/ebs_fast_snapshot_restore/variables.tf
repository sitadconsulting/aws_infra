variable "ebs_fast_snapshot_restore_availability_zone" {
  description = "(Required) Availability zone in which to enable fast snapshot restores"
  type        = string
}
variable "ebs_fast_snapshot_restore_snapshot_id" {
  description = "(Required) ID of the snapshot"
  type        = string
}
