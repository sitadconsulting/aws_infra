variable "ec2_host_asset_id" {
  description = "(Optional) The ID of the Outpost hardware asset on which to allocate the Dedicated Hosts. This parameter is supported only if you specify OutpostArn. If you are allocating the Dedicated Hosts in a Region, omit this parameter"
  type        = string
  default     = null
}
variable "ec2_host_auto_placement" {
  description = "(Optional) Indicates whether the host accepts any untargeted instance launches that match its instance type configuration, or if it only accepts Host tenancy instance launches that specify its unique host ID. Valid values: on, off. Default: on"
  type        = string
  default     = null
}
variable "ec2_host_availability_zone" {
  description = "(Required) The Availability Zone in which to allocate the Dedicated Host"
  type        = string
}
variable "ec2_host_host_recovery" {
  description = "(Optional) Indicates whether to enable or disable host recovery for the Dedicated Host. Valid values: on, off. Default: off"
  type        = string
  default     = null
}
variable "ec2_host_instance_family" {
  description = "(Optional) Specifies the instance family to be supported by the Dedicated Hosts. If you specify an instance family, the Dedicated Hosts support multiple instance types within that instance family. Exactly one of instance_family or instance_type must be specified"
  type        = string
  default     = null
}
variable "ec2_host_instance_type" {
  description = "(Optional) Specifies the instance type to be supported by the Dedicated Hosts. If you specify an instance type, the Dedicated Hosts support instances of the specified instance type only. Exactly one of instance_family or instance_type must be specified"
  type        = string
  default     = null
}
variable "ec2_host_outpost_arn" {
  description = "(Optional) ARN of the AWS Outpost on which to allocate the Dedicated Host"
  type        = string
  default     = null
}
variable "ec2_host_tags" {
  description = "(Optional) Map of tags to assign to this resource"
  type        = map(string)
  default     = {}
}
