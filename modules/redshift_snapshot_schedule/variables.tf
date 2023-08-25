variable "redshift_snapshot_schedule_definitions" {
  description = "The definition of the snapshot schedule. The definition is made up of schedule expressions, for example cron(30 12 *) or rate(12 hours)"
  type        = string
  default     = ""
}
variable "redshift_snapshot_schedule_description" {
  description = "The description of the snapshot schedule"
  type        = string
  default     = ""
}
variable "redshift_snapshot_schedule_force_destroy" {
  description = "Whether to destroy all associated clusters with this snapshot schedule on deletion. Must be enabled and applied before attempting deletion"
  type        = bool
  default     = false
}
variable "redshift_snapshot_schedule_identifier" {
  description = "The snapshot schedule identifier. If omitted, Terraform will assign a random, unique identifier"
  type        = string
  default     = null
}
variable "redshift_snapshot_schedule_identifier_prefix" {
  description = "Creates a unique identifier beginning with the specified prefix. Conflicts with identifier"
  type        = string
  default     = null
}
variable "redshift_snapshot_schedule_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
