variable "datasync_location_fsx_windows_file_system_fsx_filesystem_arn" {
  description = "(Required) ARN for the FSx for Windows file system"
  type        = string
}
variable "datasync_location_fsx_windows_file_system_password" {
  description = "(Required) The password of the user who has the permissions to access files and folders in the FSx for Windows file system"
  type        = string
}
variable "datasync_location_fsx_windows_file_system_user" {
  description = "(Required) The user who has the permissions to access files and folders in the FSx for Windows file system"
  type        = string
}
variable "datasync_location_fsx_windows_file_system_domain" {
  description = "(Optional) The name of the Windows domain that the FSx for Windows server belongs to"
  type        = string
  default     = null
}
variable "datasync_location_fsx_windows_file_system_security_group_arns" {
  description = "(Optional) ARNs of the security groups that are to use to configure the FSx for Windows file system"
  type        = list(string)
  default     = null
}
variable "datasync_location_fsx_windows_file_system_subdirectory" {
  description = "(Optional) Subdirectory to perform actions as source or destination"
  type        = string
  default     = null
}
variable "datasync_location_fsx_windows_file_system_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = map(string)
  default     = {}
}
