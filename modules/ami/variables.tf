variable "ami_architecture" {
  description = "(Optional) Machine architecture for created instances. Defaults to x86_64"
  type        = string
  default     = null
}
variable "ami_boot_mode" {
  description = "(Optional) Boot mode of the AMI. For more information"
  type        = string
  default     = null
}
variable "ami_deprecation_time" {
  description = "(Optional) Date and time to deprecate the AMI. If you specified a value for seconds, Amazon EC2 rounds the seconds to the nearest minute. Valid values: RFC3339 time string (YYYY-MM-DDTHH:MM:SSZ)"
  type        = string
  default     = null
}
variable "ami_description" {
  description = "(Optional) Longer, human-readable description for the AMI"
  type        = string
  default     = null
}
variable "ami_ena_support" {
  description = "(Optional) Whether enhanced networking with ENA is enabled. Defaults to false"
  type        = bool
  default     = null
}
variable "ami_image_location" {
  description = "(Required) Path to an S3 object containing an image manifest, e.g., created by the ec2-upload-bundle command in the EC2 command line tools"
  type        = string
  default     = null
}
variable "ami_imds_support" {
  description = "(Optional) If EC2 instances started from this image should require the use of the Instance Metadata Service V2 (IMDSv2), set this argument to v2.0"
  type        = string
  default     = null
}
variable "ami_kernel_id" {
  description = "(Required) ID of the kernel image (AKI) that will be used as the paravirtual kernel in created instances."
  type        = string
  default     = null
}
variable "ami_name" {
  description = "(Required) Region-unique name for the AMI"
  type        = string
}
variable "ami_ramdisk_id" {
  description = "(Optional) ID of an initrd image (ARI) that will be used when booting the created instances"
  type        = string
  default     = null
}
variable "ami_root_device_name" {
  description = "(Optional) Name of the root device (for example, /dev/sda1, or /dev/xvda)"
  type        = string
  default     = null
}
variable "ami_sriov_net_support" {
  description = "(Optional) When set to \"simple\" (the default), enables enhanced networking for created instances. No other value is supported at this time"
  type        = string
  default     = null
}
variable "ami_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "ami_tpm_support" {
  description = "(Optional) If the image is configured for NitroTPM support, the value is v2.0"
  type        = string
  default     = null
}
variable "ami_uefi_data" {
  description = "(Optional) Base64 representation of the non-volatile UEFI variable store"
  type        = string
  default     = null
}
variable "ami_virtualization_type" {
  description = "(Optional) Keyword to choose what virtualization mode created instances will use. Can be either "paravirtual" (the default) or "hvm". The choice of virtualization type changes the set of further arguments that are required"
  type        = string
  default     = null
}
variable "ami_ebs_block_device" {
  description = "(Optional) Nested block describing an EBS block device that should be attached to created instances"
  type        = list(object({
    device_name            = string
    delete_on_termination  = optional(bool)
    encrypted              = optional(bool)
    iops                   = optional(number)
    snapshot_id            = optional(string)
    throughput             = optional(number)
    volume_size            = optional(number)
    volume_type            = optional(string)
    outpost_arn            = optional(string)
  }))
  default     = []
}
variable "ami_ephemeral_block_device" {
  description = "(Optional) Nested block describing an ephemeral block device that should be attached to created instances"
  type        = list(object({
    device_name  = string
    virtual_name = string
  }))
  default     = []
}
