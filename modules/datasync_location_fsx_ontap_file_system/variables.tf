variable "datasync_location_fsx_ontap_file_system_security_group_arns" {
  description = "(Required) The security groups that provide access to your file system's preferred subnet. The security groups must allow outbbound traffic on the following ports (depending on the protocol you use): Network File System (NFS): TCP ports 111, 635, and 2049, Server Message Block (SMB): TCP port 445" 
  type        = list(string)
}
variable "datasync_location_fsx_ontap_file_system_storage_virtual_machine_arn" {
  description = "(Required) The ARN of the SVM in your file system where you want to copy data to of from" 
  type        = string
}
variable "datasync_location_fsx_ontap_file_system_subdirectory" {
  description = "(Optional) Path to the file share in the SVM where you'll copy your data. You can specify a junction path (also known as a mount point), qtree path (for NFS file shares), or share name (for SMB file shares) (e.g. /vol1, /vol1/tree1, share1)" 
  type        = string
  default     = null
}
variable "datasync_location_fsx_ontap_file_system_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location" 
  type        = map(string)
  default     = {}
}
variable "datasync_location_fsx_ontap_file_system_protocol" {
  description = "(Required) The data transfer protocol that DataSync uses to access your Amazon FSx file system" 
  type        = list(object({
    nfs = optional(list(object({
      mount_options = list(object({
        version = optional(string)
      }))
    })), [])
    smb = optional(list(object({
      domain        = optional(string)
      password      = string
      user          = string
      mount_options = list(object({
        version = optional(string)
      }))
    })), [])
  }))
}
