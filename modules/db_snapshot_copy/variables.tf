variable "db_snapshot_copy_copy_tags" {
  description = "Whether to copy existing tags. Defaults to false"
  type        = bool
  default     = false
}
variable "db_snapshot_copy_destination_region" {
  description = "The Destination region to place snapshot copy "
  type        = string
  default     = ""
}
variable "db_snapshot_copy_kms_key_id" {
  description = "KMS key ID"
  type        = string
  default     = ""
}
variable "db_snapshot_copy_option_group_name" {
  description = "The name of an option group to associate with the copy of the snapshot"
  type        = string
  default     = ""
}
variable "db_snapshot_copy_presigned_url" {
  description = "The URL that contains a Signature Version 4 signed request"
  type        = string
  default     = ""
}
variable "db_snapshot_copy_source_db_snapshot_identifier" {
  description = "Snapshot identifier of the source snapshot"
  type        = string
}
variable "db_snapshot_copy_target_custom_availability_zone" {
  description = "The external custom Availability Zone"
  type        = string
  default     = ""
}
variable "db_snapshot_copy_target_db_snapshot_identifier" {
  description = "The Identifier for the snapshot"
  type        = string
}
variable "db_snapshot_copy_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}

