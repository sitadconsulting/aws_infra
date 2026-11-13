variable "datasync_location_smb_agent_arns" {
  description = "(Required) A list of DataSync Agent ARNs with which this location will be associated"
  type        = list(string)
  default     = null
}
variable "datasync_location_smb_domain" {
  description = "(Optional) The name of the Windows domain the SMB server belongs to"
  type        = string
  default     = null
}
variable "datasync_location_smb_password" {
  description = "(Required) The password of the user who can mount the share and has file permissions in the SMB"
  type        = string
}
variable "datasync_location_smb_server_hostname" {
  description = "(Required) Specifies the IP address or DNS name of the SMB server. The DataSync Agent(s) use this to mount the SMB share"
  type        = string
}
variable "datasync_location_smb_subdirectory" {
  description = "(Required) Subdirectory to perform actions as source or destination. Should be exported by the NFS server"
  type        = string
}
variable "datasync_location_smb_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = map(string)
  default     = {}
}
variable "datasync_location_smb_user" {
  description = "(Required) The user who can mount the share and has file and folder permissions in the SMB share"
  type        = string
}
variable "datasync_location_smb_mount_options" {
  description = "(Optional) Configuration block containing mount options used by DataSync to access the SMB Server. Can be AUTOMATIC, SMB2, or SMB3"
  type        = list(object({
    version = optional(string)
  }))
  default     = []
}
