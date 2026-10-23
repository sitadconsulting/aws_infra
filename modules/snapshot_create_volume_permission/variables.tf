variable "snapshot_create_volume_permission_snapshot_id" {
  description = "(Required) A snapshot ID"
  type        = string
}
variable "snapshot_create_volume_permission_account_id" {
  description = "(Required) An AWS Account ID to add create volume permissions. The AWS Account cannot be the snapshot's owner"
  type        = string
}
