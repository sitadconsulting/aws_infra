variable "ebs_volume_availability_zone" {
  description = "(Required) Availability zone where the EBS volume will exist"
  type        = string
}
variable "ebs_volume_encrypted" {
  description = "(Optional) If true, the disk will be encrypted"
  type        = bool
  default     = null
}
variable "ebs_volume_final_snapshot" {
  description = "(Optional) If true, snapshot will be created before volume deletion. Any tags on the volume will be migrated to the snapshot. By default set to false"
  type        = bool
  default     = null
}
variable "ebs_volume_iops" {
  description = "(Optional) Amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3"
  type        = number
  default     = null
}
variable "ebs_volume_kms_key_id" {
  description = "(Optional) ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true. Note: Terraform must be running with credentials which have the GenerateDataKeyWithoutPlaintext permission on the specified KMS key as required by the EBS KMS CMK volume provisioning process to prevent a volume from being created and almost immediately deleted"
  type        = string
  default     = null
}
variable "ebs_volume_multi_attach_enabled" {
  description = "(Optional) Specifies whether to enable Amazon EBS Multi-Attach. Multi-Attach is supported on io1 and io2 volumes"
  type        = bool
  default     = null
}
variable "ebs_volume_outpost_arn" {
  description = "(Optional) ARN of the Outpost"
  type        = string
  default     = null
}
variable "ebs_volume_size" {
  description = "(Optional) Size of the drive in GiBs"
  type        = number
  default     = null
}
variable "ebs_volume_snapshot_id" {
  description = "(Optional) A snapshot to base the EBS volume off of"
  type        = string
  default     = null
}
variable "ebs_volume_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "ebs_volume_throughput" {
  description = "(Optional) Throughput that the volume supports, in MiB/s. Only valid for type of gp3"
  type        = number
  default     = null
}
variable "ebs_volume_type" {
  description = "(Optional) Type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1 (Default: gp2)"
  type        = string
  default     = null
}
variable "ebs_volume_volume_initialization_rate" {
  description = "(Optional) EBS provisioned rate for volume initialization, in MiB/s, at which to download the snapshot blocks from Amazon S3 to the volume. This argument can only be set if snapshot_id is specified"
  type        = number
  default     = null
}
