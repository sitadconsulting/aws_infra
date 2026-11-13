variable "datasync_location_nfs_server_hostname" {
  description = "(Required) Specifies the IP address or DNS name of the NFS server. The DataSync Agent(s) use this to mount the NFS server"
  type        = string
}  
variable "datasync_location_nfs_subdirectory" {
  description = "(Required) Subdirectory to perform actions as source or destination. Should be exported by the NFS server"
  type        = string
}
variable "datasync_location_nfs_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = map(string)
  default     = {}
}
variable "datasync_location_nfs_mount_options" {
  description = "(Optional) Configuration block containing mount options used by DataSync to access the NFS Server"
  type        = list(object({
    version = optional(string) 
  }))
  default     = []
}
variable "datasync_location_nfs_on_prem_config" {
  description = "(Required) Configuration block containing information for connecting to the NFS File System"
  type        = list(object({
    agent_arns = list(string)
  }))
}
