variable "dms_instance_profile_availability_zone" {
  description = "(Optional) Availability Zone where the instance profile runs. Default is a random, system-chosen Availability Zone"
  type        = string
  default     = null
}
variable "dms_instance_profile_description" {
  description = "(Optional) Description for the instance profile"
  type        = string
  default     = null
}
variable "dms_instance_profile_kms_key_arn" {
  description = "(Optional) ARN of the KMS key used to encrypt the connection parameters for the instance profile. If you don't specify a value, DMS uses your default encryption key"
  type        = string
  default     = null
}
variable "dms_instance_profile_name" {
  description = "(Optional) Name for the instance profile. If omitted, DMS assigns a generated name"
  type        = string
  default     = null
}
variable "dms_instance_profile_network_type" {
  description = "(Optional) Network type for the instance profile. Valid values are IPV4, IPV6, and DUAL"
  type        = string
  default     = null
}
variable "dms_instance_profile_publicly_accessible" {
  description = "(Optional) Whether the instance profile is publicly accessible. Default is true"
  type        = bool
  default     = true
}
variable "dms_instance_profile_subnet_group_identifier" {
  description = "(Optional) Subnet group to associate with the instance profile"
  type        = string
  default     = null
}
variable "dms_instance_profile_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "dms_instance_profile_vpc_security_group_ids" {
  description = "(Optional) VPC security group IDs to be used with the instance profile. The VPC security groups must work with the VPC containing the instance profile"
  type        = list(string)
  default     = null
}
