variable "launch_configuration_associate_public_ip_address" {
  description = "(Optional) Associate a public IP address with an instance in a VPC"
  type        = bool
  default     = false
}
variable "launch_configuration_ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}
variable "launch_configuration_enable_monitoring" {
  description = "(Optional) Enables/disables detailed monitoring. This is enabled by default"
  type        = bool
  default     = false
}
variable "launch_configuration_iam_instance_profile" {
  description = "(Optional) The name attribute of the IAM instance profile to associate with launched instances"
  type        = string
  default     = null
}
variable "launch_configuration_image_id" {
  description = "(Required) The EC2 image ID to launch"
  type        = string
}
variable "launch_configuration_instance_type" {
  description = "(Required) The size of instance to launch"
  type        = string
}
variable "launch_configuration_key_name" {
  description = "(Optional) The key name that should be used for the instance"
  type        = string
  default     = null
}
variable "launch_configuration_name" {
  description = "(Optional) The name of the launch configuration. If you leave this blank, Terraform will auto-generate a unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "launch_configuration_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "launch_configuration_placement_tenancy" {
  description = "(Optional) The tenancy of the instance. Valid values are default or dedicated"
  type        = string
  default     = null
}
variable "launch_configuration_security_groups" {
  description = "(Optional) A list of associated security group IDs"
  type        = list(string)
  default     = null
}
variable "launch_configuration_spot_price" {
  description = "(Optional; Default: On-demand price) The maximum price to use for reserving spot instances"
  type        = string
  default     = null
}
variable "launch_configuration_user_data" {
  description = "(Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead"
  type        = string
  default     = null
}
variable "launch_configuration_user_data_base64" {
  description = "(Optional) Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  type        = string
  default     = null
}
variable "launch_configuration_ebs_block_device" {
  description = "(Optional) Additional EBS block devices to attach to the instance"
  type        = list(object({
    delete_on_termination = optional(bool)
    device_name           = string
    encrypted             = optional(bool)
    iops                  = optional(number)
    no_device             = optional(bool)
    snapshot_id           = optional(string)
    throughput            = optional(number)
    volume_size           = optional(number)
    volume_type           = optional(string)
  }))
  default     = []
}
variable "launch_configuration_ephemeral_block_device" {
  description = "(Optional) Customize Ephemeral (also known as \"Instance Store\") volumes on the instance"
  type        = list(object({
    device_name  = string
    no_device    = optional(bool)
    virtual_name = optional(string)
  }))
  default     = []
}
variable "launch_configuration_metadata_options" {
  description = "The metadata options for the instance"
  type        = list(object({
    http_endpoint               = optional(string)
    http_put_response_hop_limit = optional(number)
    http_tokens                 = optional(string)
  }))
  default     = []
}
variable "launch_configuration_root_block_device" {
  description = "(Optional) Customize details about the root block device of the instance"
  type        = list(object({
    delete_on_termination = optional(bool)
    encrypted             = optional(bool)
    iops                  = optional(number)
    throughput            = optional(number)
    volume_size           = optional(number)
    volume_type           = optional(string)
  }))
  default     = []
}
