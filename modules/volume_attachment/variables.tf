variable "volume_attachment_device_name" {
  description = "(Required) Device name to expose to the instance (for example, /dev/sdh or xvdh)"
  type        = string
}
variable "volume_attachment_force_detach" {
  description = "(Optional) Whether to force the volume to detach. Useful if previous attempts failed, but use this option only as a last resort, as this can result in data loss"
  type        = bool
  default     = null
}
variable "volume_attachment_instance_id" {
  description = "(Required) ID of the Instance to attach to"
  type        = string
  default     = null
}
variable "volume_attachment_skip_destroy" {
  description = "(Optional) Whether to skip detaching the volume from the instance to which it is attached at destroy time, and instead just remove the attachment from Terraform state. This is useful when destroying an instance which has volumes created by some other means attached"
  type        = bool
  default     = null
}
variable "volume_attachment_stop_instance_before_detaching" {
  description = "(Optional) Whether to ensure that the target instance is stopped before trying to detach the volume. Stops the instance, if it is not already stopped"
  type        = bool
  default     = null
}
variable "volume_attachment_volume_id" {
  description = "(Required) ID of the Volume to be attached"
  type        = string
}
