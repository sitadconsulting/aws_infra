variable "dms_replication_instance_allocated_storage" {
  description = "(Optional, Default: 50, Min: 5, Max: 6144) The amount of storage (in gigabytes) to be initially allocated for the replication instance"
  type        = number
  default     = null
}
variable "dms_replication_instance_allow_major_version_upgrade" {
  description = "(Optional, Default: false) Indicates that major version upgrades are allowed"
  type        = bool
  default     = false
}
variable "dms_replication_instance_apply_immediately" {
  description = "(Optional, Default: false) Indicates whether the changes should be applied immediately or during the next maintenance window. Only used when updating an existing resource"
  type        = bool
  default     = false
}
variable "dms_replication_instance_auto_minor_version_upgrade" {
  description = "(Optional, Default: false) Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window"
  type        = bool
  default     = false
}
variable "dms_replication_instance_availability_zone" {
  description = "(Optional) The EC2 Availability Zone that the replication instance will be created in"
  type        = string
  default     = null
}
variable "dms_replication_instance_dns_name_servers" {
  description = " (Optional) A list of custom DNS name servers supported for the replication instance to access your on-premise source or target database. This list overrides the default name servers supported by the replication instance. You can specify a comma-separated list of internet addresses for up to four on-premise DNS name servers "
  type        = list(string)
  default     = null
}
variable "dms_replication_instance_engine_version" {
  description = "(Optional) The engine version number of the replication instance"
  type        = string
  default     = null
}
variable "dms_replication_instance_kms_key_arn" {
  description = "(Optional) ARN for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region "
  type        = string
  default     = null
}
variable "dms_replication_instance_multi_az" {
  description = "(Optional) Specifies if the replication instance is a multi-az deployment. You cannot set the availability_zone parameter if the multi_az parameter is set to true"
  type        = bool
  default     = null
}
variable "dms_replication_instance_network_type" {
  description = "(Optional) The type of IP address protocol used by a replication instance. Valid values: IPV4, DUAL"
  type        = string
  default     = null
}
variable "dms_replication_instance_preferred_maintenance_window" {
  description = "(Optional) The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC)"
  type        = string
  default     = null
}
variable "dms_replication_instance_publicly_accessible" {
  description = "(Optional, Default: false) Specifies the accessibility options for the replication instance. A value of true represents an instance with a public IP address. A value of false represents an instance with a private IP address"
  type        = bool
  default     = false
}
variable "dms_replication_instance_replication_instance_class" {
  description = "(Required) The compute and memory capacity of the replication instance as specified by the replication instance class"
  type        = string
}
variable "dms_replication_instance_replication_instance_id" {
  description = "(Required) The replication instance identifier. This parameter is stored as a lowercase string"
  type        = string
}
variable "dms_replication_instance_replication_subnet_group_id" {
  description = "(Optional) A subnet group to associate with the replication instance"
  type        = string
  default     = null
}
variable "dms_replication_instance_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "dms_replication_instance_vpc_security_group_ids" {
  description = "(Optional) A list of VPC security group IDs to be used with the replication instance. The VPC security groups must work with the VPC containing the replication instance"
  type        = list(string)
  default     = null
}
variable "dms_replication_instance_kerberos_authentication_settings" {
  description = "(Optional) Configuration block for settings required for Kerberos authentication"
  type        = list(object({
    key_cache_secret_iam_arn = string
    key_cache_secret_id      = string
    krb5_file_contents       = string
  }))
  default     = []
}
