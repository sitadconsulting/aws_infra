variable "datasync_location_fsx_openzfs_file_system_fsx_filesystem_arn" {
  description = "(Required) ARN for the FSx for OpenZfs file system"
  type        = string
}
variable "datasync_location_fsx_openzfs_file_system_security_group_arns" {
  description = "(Optional) ARNs of the security groups that are to use to configure the FSx for openzfs file system"
  type        = list(string)
  default     = null
}
variable "datasync_location_fsx_openzfs_file_system_subdirectory" {
  description = "(Optional) Subdirectory to perform actions as source or destination. Must start with /fsx"
  type        = string
  default     = null
}
variable "datasync_location_fsx_openzfs_file_system_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        =
  default     =
}
variable "datasync_location_fsx_openzfs_file_system_protocol" {
  description = "(Required) The type of protocol that DataSync uses to access your file system"
  type        = list(object({
    nfs = list(object({
      mount_options = list(object({
        version = optional(string)
      }))
    }))
  }))
}
