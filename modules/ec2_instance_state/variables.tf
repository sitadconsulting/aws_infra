variable "ec2_instance_state_force" {
  description = "(Optional) Whether to request a forced stop when state is stopped. Otherwise (i.e., state is running), ignored. When an instance is forced to stop, it does not flush file system caches or file system metadata, and you must subsequently perform file system check and repair. Not recommended for Windows instances. Defaults to false"
  type        = bool
  default     = false
}
variable "ec2_instance_state_instance_id" {
  description = "(Required) ID of the instance"
  type        = string
}
variable "ec2_instance_state_state" {
  description = "(Required) - State of the instance. Valid values are stopped, running"
  type        = string
}
