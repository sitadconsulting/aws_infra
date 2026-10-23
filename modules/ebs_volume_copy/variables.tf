variable "ebs_volume_copy_iops" {
  description = "(Optional) Provisioned IOPS for the copied volume. Use only with volume types that support provisioned IOPS, such as gp3"
  type        = number
  default     = null
}
variable "ebs_volume_copy_size" {
  description = "(Optional) Size of the copied volume, in GiB"
  type        = number
  default     = null
}
variable "ebs_volume_copy_source_volume_id" {
  description = "(Required) ID of the source EBS volume to copy. Changing this value forces replacement of the resource"
  type        = string
}
variable "ebs_volume_copy_tags" {
  description = "(Optional) A map of tags to assign to the copied volume"
  type        = map(string)
  default     = {}
}
variable "ebs_volume_copy_throughput" {
  description = "(Optional) Throughput for the copied volume, in MiB/s. Valid only when volume_type is gp3"
  type        = number
  default     = null
}
variable "ebs_volume_copy_volume_type" {
  description = "(Optional) Type of the copied EBS volume. Valid values include gp2, gp3, io1, io2, sc1, st1, and standard"
  type        = string
  default     = null
}
