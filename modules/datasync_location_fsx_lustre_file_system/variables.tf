variable "datasync_location_fsx_lustre_file_system_fsx_filesystem_arn" {
  description = "(Required) ARN for the FSx for Lustre file system"
  type        = string
}
variable "datasync_location_fsx_lustre_file_system_security_group_arns" {
  description = "(Optional) ARNs of the security groups that are to use to configure the FSx for Lustre file system"
  type        = list(string)
  default     = null
}
variable "datasync_location_fsx_lustre_file_system_subdirectory" {
  description = "(Optional) Subdirectory to perform actions as source or destination"
  type        = string
  default     = null
}
variable "datasync_location_fsx_lustre_file_system_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = string
  default     = null
}
