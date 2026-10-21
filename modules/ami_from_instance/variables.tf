variable "ami_from_instance_name" {
  description = "(Required) Region-unique name for the AMI"
  type        = string
}
variable "ami_from_instance_source_instance_id" {
  description = "(Required) ID of the instance to use as the basis of the AMI"
  type        = string
}
variable "ami_from_instance_snapshot_without_reboot" {
  description = "(Optional) Boolean that overrides the behavior of stopping the instance before snapshotting. This is risky since it may cause a snapshot of an inconsistent filesystem state, but can be used to avoid downtime if the user otherwise guarantees that no filesystem writes will be underway at the time of snapshot"
  type        = bool
  default     = null
}
variable "ami_from_instance_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
