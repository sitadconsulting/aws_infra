variable "datasync_location_efs_access_point_arn" {
  description = "(Optional) ARN of the access point that DataSync uses to access the Amazon EFS file system"
  type        = string
  default     = null
}
variable "datasync_location_efs_efs_file_system_arn" {
  description = "(Required) ARN of EFS File System"
  type        = string
}
variable "datasync_location_efs_file_system_access_role_arn" {
  description = "(Optional) Specifies an Identity and Access Management (IAM) role that DataSync assumes when mounting the Amazon EFS file system"
  type        = string
  default     = null
}
variable "datasync_location_efs_in_transit_encryption" {
  description = "(Optional) Specifies whether you want DataSync to use TLS encryption when transferring data to or from your Amazon EFS file system. Valid values are NONE and TLS1_2"
  type        = string
  default     = null
}
variable "datasync_location_efs_subdirectory" {
  description = "(Optional) Subdirectory to perform actions as source or destination. Default /"
  type        = string
  default     = null
}
variable "datasync_location_efs_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = map(string)
  default     = {}
}
variable "datasync_location_efs_ec2_config" {
  description = "(Required) Configuration block containing EC2 configurations for connecting to the EFS File System"
  type        = list(object({
    security_group_arns = list(string)
    subnet_arn          = string
  }))
}
